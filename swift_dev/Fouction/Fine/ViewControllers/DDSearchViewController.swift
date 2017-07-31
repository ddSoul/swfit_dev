//
//  DDSearchViewController.swift
//  swift_dev
//
//  Created by Pactera_Admin on 2017/7/31.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class DDSearchViewController: UIViewController,UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
    }
    // 设置导航栏
    func setupNav() {
        self.view.backgroundColor = UIColor.white
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView())
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(navigationBackClick))
    }

    /// 返回按钮、取消按钮点击
    func navigationBackClick() {
//        navigationController?.popViewController(animated: true)
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
    


}
