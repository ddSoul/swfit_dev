//
//  MyTabBarController.swift
//  TodayNews-Swift
//
//  Created by 杨蒙 on 17/2/7.
//  Copyright © 2017年 hrscy. All rights reserved.
//
// 自定义底部tabbar控制器

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColor(red: 245 / 255, green: 90 / 255, blue: 93 / 255, alpha: 1/0)
        
        addChildViewControllers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /**
     * 添加子控制器
     */
    private func addChildViewControllers() {
        addChildViewController(childController: HomeViewController(), title: "首页", imageName: "tab_home", selectedImage: "tab_home_s")
        addChildViewController(childController: DDSearchViewController(), title: "搜索", imageName: "tab_home", selectedImage: "tab_home_s")
        addChildViewController(childController: HomeViewController(), title: "微头条", imageName: "tab_home", selectedImage: "tab_home_s")
        addChildViewController(childController: DDLoginViewController(), title: "未登录", imageName: "tab_home", selectedImage: "tab_home_s")
    }
    
    private func addChildViewController(childController: UIViewController, title: String, imageName: String, selectedImage: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImage)
        childController.title = title
        let navC = MyNavigationController(rootViewController: childController)
        addChildViewController(navC)
    }

}
