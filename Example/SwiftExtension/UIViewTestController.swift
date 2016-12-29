//
//  UIViewTestController.swift
//  SwiftExtension
//
//  Created by jumpingfrog0 on 01/12/2016.
//
//
//  Copyright (c) 2016 Jumpingfrog0 LLC
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class UIViewTestController: UIViewController {

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
        let amazingView = AmazingView.load(fromNibName: "AmazingView", bundle: nil) as? AmazingView
        amazingView?.titleLabel.text = "指定Nib名称"
        amazingView?.frame = CGRect(x: 10, y: 570, width: 100, height: 100)
        view.addSubview(amazingView!)
        
        let amazingView2 = AmazingView.loadFromNib() as? AmazingView
        amazingView2?.titleLabel.text = "不指定Nib名称"
        amazingView2?.frame = CGRect(x: 120, y: 570, width: 100, height: 100)
        view.addSubview(amazingView2!)
        
        let amazingView_index_1 = AmazingView.loadFromNib(ofIndex: 1) as? AmazingView
        amazingView_index_1?.titleLabel.text = "根据index生成Nib中对应的view"
        amazingView_index_1?.frame = CGRect(x: 230, y: 570, width: 100, height: 100)
        view.addSubview(amazingView_index_1!)
        
        jf_print(AmazingView.entityName())
        
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
        // Please see the view3 of UIViewTestController at Main.storyboard.
    }
    
    
    @IBAction func removeAllSubviews() {
        view4.removeAllSubviews()
    }
}
