//
//  UIImageTestController.swift
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

class UIImageTestController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Test UIImage extension
        imageView1.image = UIImage.image(text: "AA", size: CGSize(width: 100, height: 100), backgroudColor: UIColor.yellow, textColor: UIColor.green)
        imageView2.image = UIImage.markerImage(text: "广州", size: CGSize(width: 100, height: 100), backgroudColor: UIColor.cyan, textColor: UIColor.red)
        imageView3.image = UIImage(named: "minion")?.cropping(to: CGRect(x: 500, y: 300, width: 100, height: 100))
        imageView4.image = UIImage.captureView(view)
        imageView5.image = UIImage.resizableImage(named: "qq_bubble.jpg")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isModal() {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(close))
        }
    }
    
    func close() {
        dismiss(animated: true, completion: nil)
    }
}

extension UIImageTestController {    
    class func present(in controller: UIViewController) {
        controller.present(self, fromStoryboard: "Main", inNavigationController: UINavigationController.self)
    }
    
    class func push(inNavigationController navVc: UINavigationController?) {
        self.push(inNavigationController: navVc, fromStoryboard: "Main")
    }
    
    
}
