//
//  TestViewController3.swift
//  SwiftExtension
//
//  Created by sheldon on 2016/11/30.
//  Copyright © 2016年 jumpingfrog0. All rights reserved.
//

import UIKit

class TestViewController3: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view4: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Test UIView extension
        
        // Mask
        view1.setBorder(cornerRadius: 25, color: UIColor.white, width: 2)
        view2.setRoundCorners(byRoundingCorners: .topLeft, radius: 10)
        
        // Nib
        let amazingView = AmazingView.load(fromNibName: "AmazingView", bundle: nil)
        amazingView?.frame = CGRect(x: 10, y: 520, width: 100, height: 100)
        view.addSubview(amazingView!)
        
        let amazingView2 = AmazingView.loadFromNib()
        amazingView2?.frame = CGRect(x: 120, y: 520, width: 100, height: 100)
        view.addSubview(amazingView2!)
        
        let amazingView_index_1 = AmazingView.loadFromNib(ofIndex: 1)
        amazingView_index_1?.frame = CGRect(x: 230, y: 520, width: 100, height: 100)
        view.addSubview(amazingView_index_1!)
        
        jf_print(AmazingView.className())
        
        // Frame
        jf_print("The x of view1 is \(view1.x)")               // 200
        jf_print("The y of view1 is \(view1.y)")               // 100
        jf_print("The width of view1 is \(view1.width)")       // 50
        jf_print("The height of view1 is \(view1.height)")     // 50
        jf_print("The right of view1 is \(view1.right)")       // 250
        jf_print("The bottom of view1 is \(view1.bottom)")     // 150
        jf_print("The midX of view1 is \(view1.midX)")         // 225
        jf_print("The midY of view1 is \(view1.midY)")         // 125
        
        // XibConfiguration
        // Please see the view3 of TestViewController3 at Main.storyboard.
        
        // Other
        view4.removeAllSubviews()
        jf_print("All subviews of view4 has been removed.")
    }
}
