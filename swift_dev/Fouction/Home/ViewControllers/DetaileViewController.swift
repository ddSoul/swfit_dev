//
//  DetaileViewController.swift
//  swift_dev
//
//  Created by Pactera_Admin on 2017/7/28.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class DetaileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }

    func setUpViews() {
        self.title = "详情"
        self.view.backgroundColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
