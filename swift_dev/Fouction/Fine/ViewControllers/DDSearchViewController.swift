//
//  DDSearchViewController.swift
//  swift_dev
//
//  Created by Pactera_Admin on 2017/7/31.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class DDSearchViewController: UIViewController,UISearchBarDelegate {

    //上一个按钮的maxX加上间距
    private var lastX: CGFloat = 30
    //上一个按钮的y值
    private var lastY: CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setUpHotTagViews()
    }
    // 设置导航栏
    func setupNav() {
        self.view.backgroundColor = UIColor.white
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView())
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(navigationBackClick))
    }
    func setUpHotTagViews() {
        
        //按钮文字的宽度
        var btnW: CGFloat = 0
        //按钮的高度
        let btnH: CGFloat = 30
        //文字与按钮两边的距离之和
        let addW: CGFloat = 30
        //横向间距
        let marginX: CGFloat = 10
        //纵向间距
        let marginY: CGFloat = 10
        
        for i in 0..<tags.count{
            print("\(i)")
            let btn = UIButton(type: .custom)
            btn.setTitle(tags[i], for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.titleLabel?.sizeToFit()
            btn.backgroundColor = UIColor.white
            btn.layer.cornerRadius = 15
            btn.layer.masksToBounds = true
            btn.layer.borderWidth = 0.5
            btn.layer.borderColor = UIColor.red.cgColor
            btn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
            //按钮的总宽度
            btnW = (btn.titleLabel?.bounds.width)! + addW
            if ScreenW - lastX > btnW {
                btn.frame = CGRect(x: lastX, y: lastY, width: btnW, height: btnH)
            } else {
                btn.frame = CGRect(x: 30, y: lastY + marginY + btnH, width: btnW, height: btnH)
            }
            lastX = btn.frame.maxX + marginX
            lastY = btn.frame.origin.y
            self.view.addSubview(btn)

        }
    }

    func btnClick(sender:UIButton) {
        print("__btn:\(sender)")
    }
    /// 返回按钮、取消按钮点击
    func navigationBackClick() {
//        navigationController?.popViewController(animated: true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("click -- search")
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("click -- cancle")
        searchBar.resignFirstResponder()
    }
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "搜索商品、专题"
        return searchBar
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private lazy var tags:[String] = {
        var tags = [String]()
        tags = ["微博","陈奕迅","jay","战狼二获得一比一","达康书记","哦","哈哈","我哦我哦我飞","中国新歌声","mY"]
        return tags
    }()
    
}
