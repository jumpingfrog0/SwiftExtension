//
//  ViewController.swift
//  SwiftExtension
//
//  Created by sheldon on 2016/11/23.
//  Copyright © 2016年 jumpingfrog0. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var strikethroughLabel: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Log
        jf_print("debug print -- \(self)")
        jf_assert(1 == 1, "no")
        
        // String + Measurement
        let str = "我是中国人"
        print(str.height(constrainedWidth: 50, systemFontSize: 13))
        print(str.maxWidth(systemFontSize: 13))
        
        // strikethrough
        strikethroughLabel.attributedText = NSMutableAttributedString.strikethrough(withText: strikethroughLabel.text)
        label2.attributedText = NSMutableAttributedString.strikethrough(withText: label2.text, color: UIColor.red)
        
        // underline
        label3.attributedText = NSMutableAttributedString.underline(withText: label3.text)
        label4.attributedText = NSMutableAttributedString.underline(withText: label4.text, color: UIColor.blue)
        
        // most top view controller
        let topVc = UIApplication.shared.mostTopViewController()
        jf_print(topVc)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let alertController = UIAlertController(title: "Amazing", message: "Amazing Message", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            jf_print("click OK button")
            let topVc = UIApplication.shared.mostTopViewController()
            jf_print(topVc)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            jf_print("click Cancel button")
        }))
        present(alertController, animated: true, completion: {
            let topVc = UIApplication.shared.mostTopViewController()
            jf_print(topVc)
        })
    }
}

