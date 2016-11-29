//
//  OneViewController.swift
//  SwiftExtension
//
//  Created by sheldon on 2016/11/29.
//  Copyright © 2016年 jumpingfrog0. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // most top view controller
        let topVc = UIApplication.shared.mostTopViewController()
        jf_print(topVc)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        let topVc = UIApplication.shared.mostTopViewController()
//        jf_print(topVc)
//    }

}
