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
        setupNav()
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        self.title = "Login"
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(phoneNumberTf)
        self.view.addSubview(pwdTf)
        self.view.addSubview(loginBtn)
        phoneNumberTf.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(50)
        }
        pwdTf.snp.makeConstraints { (make) in
            make.top.equalTo(phoneNumberTf.snp.bottom).offset(20)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(50)
        }
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(pwdTf.snp.bottom).offset(30)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(50)
        }
    }
    
    /// 设置导航栏
    func setupNav() {
        view.backgroundColor = UIColor.white
        let rightItemImg = UIImage.init(named: "content-details_share_16x16_-1");
        rightItemImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(rightItemClick))
    }
    
    func rightItemClick() {
        print("logon")
    }
    
    func login() {
        if loginBtn.isSelected {
            loginBtn.isSelected = false
            SVProgressHUD.dismiss()
        }else {
            loginBtn.isSelected = true
            SVProgressHUD.show()
        }
        
        print("Login")
    }
    
    fileprivate lazy var phoneNumberTf: UITextField = {
        let phoneNumberTf = UITextField()
        phoneNumberTf.layer.borderWidth = 1
        phoneNumberTf.layer.borderColor = UIColor.gray.cgColor
        phoneNumberTf.placeholder = "请输入您的手机号/QQ号"
        return phoneNumberTf
    }()
    
    fileprivate lazy var pwdTf: UITextField = {
        let pwdTf = UITextField()
        pwdTf.layer.borderWidth = 1
        pwdTf.layer.borderColor = UIColor.gray.cgColor
        pwdTf.placeholder = "请输入您的密码"
        return pwdTf
    }()
    
    fileprivate lazy var loginBtn: UIButton = {
        let loginBtn = UIButton()
        loginBtn.backgroundColor = UIColor.orange
        loginBtn.layer.cornerRadius = 5
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        loginBtn.addTarget(self, action: #selector(login), for: UIControlEvents.touchUpInside)
        return loginBtn
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
