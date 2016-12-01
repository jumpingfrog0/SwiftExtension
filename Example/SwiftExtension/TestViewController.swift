//
//  TestViewController.swift
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

class TestViewController: UIViewController {
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        testLog()
        testString()
        testUIApplication()
        testUIColor()
        testUIFont()
        testUILabel()
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
            
            jf_print("----- after present UIAlertController -----")
            jf_print(topVc)
            jf_print("----- after present UIAlertController -----")
        })
    }
    
    // MARK: Log
    func testLog() {
        jf_print("debug print -- \(self)")
        jf_assert(1 == 1, "no")
    }
    
    // MARK: String
    func testString() {
        // measurement
        let str = "我是中国人"
        print(str.height(constrainedWidth: 50, systemFontSize: 13))
        print(str.maxWidth(systemFontSize: 13))
        
        // strikethrough
        label1.attributedText = NSMutableAttributedString.strikethrough(withText: label1.text)
        label2.attributedText = NSMutableAttributedString.strikethrough(withText: label2.text, color: UIColor.red)
        
        // underline
        label3.attributedText = NSMutableAttributedString.underline(withText: label3.text)
        label4.attributedText = NSMutableAttributedString.underline(withText: label4.text, color: UIColor.blue)
    }
    
    // MARK: UIApplication
    func testUIApplication() {
        // most top view controller
        let topVc = UIApplication.shared.mostTopViewController()
        jf_print("----- before present UIAlertController -----")
        jf_print(topVc)
        jf_print("----- before present UIAlertController -----")
    }
    
    // MARK: UIColor
    func testUIColor() {
        label2.textColor = UIColor(r: 255, g:0, b: 0)
    }
    
    // MARK: UIFont
    func testUIFont() {
        label1.font.printFontNames()
    }
    
    // MARK: UILabel
    func testUILabel() {
        // strikethrough
        label5.strikethrough()
        label6.strikethrough(color: UIColor.yellow)
        
        // underline
        label7.underline()
        label8.underline(color: UIColor.orange)
        
        // set text color
        let colors = [UIColor.blue, UIColor.orange, UIColor.green]
        let ranges = [NSRange(location: 1, length: 1), NSRange(location: 2, length: 4), NSRange(location: 6, length: 2)]
        label9.setTextColors(colors, ranges: ranges)
    }
}

