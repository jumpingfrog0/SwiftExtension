//
//  TestViewController2.swift
//  SwiftExtension
//
//  Created by sheldon on 2016/11/29.
//  Copyright © 2016年 jumpingfrog0. All rights reserved.
//

import UIKit

class TestViewController2: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView1.image = UIImage.image(text: "AA", size: CGSize(width: 100, height: 100), backgroudColor: UIColor.yellow, textColor: UIColor.green)
        imageView2.image = UIImage.markerImage(text: "广州", size: CGSize(width: 100, height: 100), backgroudColor: UIColor.cyan, textColor: UIColor.red)
        imageView3.image = UIImage(named: "minion")?.cropping(to: CGRect(x: 500, y: 300, width: 100, height: 100))
        imageView4.image = UIImage.captureView(view)
        imageView5.image = UIImage.resizableImage(named: "qq_bubble.jpg")
    }

}
