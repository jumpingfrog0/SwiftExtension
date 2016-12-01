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
        jf_print("Top view controller is \(topVc)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.jf_setBackgroundColor(UIColor.brown)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.jf_reset()
    }
    
    @IBAction func showTabBar(_ sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            sender.setTitle("Hide Tab Bar", for: .normal)
            self.showTabBar(of: self.tabBarController!)
        } else {
            sender.isSelected = true
            sender.setTitle("Show Tab Bar", for: .normal)
            self.hideTabBar(of: self.tabBarController!)
        }
    }

}
