//  UIKitClutterTestController.swift
//  SwiftExtension
//
//  Created by jumpingfrog0 on 29/12/2016.
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

/***
 *
 * test JFLog \ UIApplication \ UIColor \ UIFont
 *
 ***/


class UIKitClutterTestController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testLog()
        testUIColor()
        testUIFont()
    }
    
    // MARK: Log
    func testLog() {
        jf_print("debug print -- \(self)")
        jf_assert(1 == 1, "no")
    }
    
    // MARK: UIColor
    func testUIColor() {
        label.textColor = UIColor(r: 255, g:0, b: 0)
    }
    
    // MARK: UIFont
    func testUIFont() {
        label.font.printFontNames()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Test UIApplication
        // Get most top view controller
        let alertController = UIAlertController(title: "测试mostTopViewController", message: "请查看控制台，目前最顶层的控制器是UIKitClutterTestController，因为忽略了UIAlertController", preferredStyle: .alert)
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
            
            jf_print("----- after present UIAlertController -----")
            jf_print(topVc)
            jf_print("----- after present UIAlertController -----")
        })
    }
}
