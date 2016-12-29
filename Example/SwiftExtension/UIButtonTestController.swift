//  UIButtonTestController.swift
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

class UIButtonTestController: UIViewController {
    
    @IBOutlet weak var codeButton: UIButton!
    var timer: Timer?
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Test Submitting
    @IBAction func clickCodeButton(button: UIButton) {
        seconds = 60
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true
            , block:
            { [weak self] (timer) in
                
                self?.seconds -= 1
                
                guard let remainder = self?.seconds, remainder >= 0  else {
                    self?.seconds = 60
                    self?.codeButton.endSubmitting()
                    self?.timer?.invalidate()
                    self?.timer = nil
                    return
                }
                
                self?.codeButton.changeSubmittingTitle("\(remainder)秒")
        })
        button.beginSubmitting(title: "60秒")
        RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes)
    }
}
