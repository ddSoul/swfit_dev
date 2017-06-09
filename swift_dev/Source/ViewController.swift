//
//  ViewController.swift
//  swift_dev
//
//  Created by Pactera_Admin on 2017/6/9.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - 初始化视图
    func setupViews() {
        self.title = "首页"
        self.view.backgroundColor = UIColor.gray
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

