//
//  ViewController.swift
//  SwiftExtension
//
//  Created by sheldon on 2016/11/23.
//  Copyright © 2016年 jumpingfrog0. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
         jf_print("debug print -- \(self)")
        
        jf_assert(1 == 1, "no")
    }


}

