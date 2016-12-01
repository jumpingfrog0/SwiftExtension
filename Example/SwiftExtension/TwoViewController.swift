//
//  TwoViewController.swift
//  SwiftExtension
//
//  Created by sheldon on 2016/11/29.
//  Copyright © 2016年 jumpingfrog0. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let alertController = UIAlertController(title: "Amazing", message: "Amazing Message", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            jf_print("click OK button")
            let topVc = UIApplication.shared.mostTopViewController()
            jf_print("Top view controller is \(topVc)")
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            jf_print("click Cancel button")
        }))
        present(alertController, animated: true, completion: {
            let topVc = UIApplication.shared.mostTopViewController()
            jf_print("Top view controller is \(topVc)")
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.jf_setBackgroundColor(UIColor.clear)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.jf_reset()
    }
}
