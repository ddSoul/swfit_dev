//
//  DDLoginViewController.swift
//  swift_dev
//
//  Created by Pactera_Admin on 2017/7/28.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class DDLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        self.title = "Login"
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(phoneNumberTf)
        self.view.addSubview(loginBtn)
        phoneNumberTf.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(60)
        }
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(phoneNumberTf.snp.bottom).offset(30)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(60)
        }
    }
    
    func login() {
        print("Login")
    }
    
    fileprivate lazy var phoneNumberTf: UITextField = {
        let phoneNumberTf = UITextField()
        phoneNumberTf.backgroundColor = UIColor.orange
        return phoneNumberTf
    }()
    
    fileprivate lazy var loginBtn: UIButton = {
        let loginBtn = UIButton()
        loginBtn.backgroundColor = UIColor.orange
        loginBtn.addTarget(self, action: #selector(login), for: UIControlEvents.touchUpInside)
        return loginBtn
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
