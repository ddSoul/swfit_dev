//
//  XLReachability.swift
//  swift_dev
//
//  Created by ddSoul on 2017/8/1.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class XLReachabilityTool: NSObject {
    //需要全局
    let reachability = Reachability()!
    var presentVc = UIViewController()
}

extension XLReachabilityTool{

    //随便添加一个检测网络的方法
    func NetworkStatusListener(presentVc:UIViewController) {
        //0、展示视图需要
        self.presentVc = presentVc
        // 1、设置网络状态消息监听 
        //2、获得网络Reachability对象
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged),name: ReachabilityChangedNotification,object: reachability)
        do{
            // 3、开启网络状态消息监听
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
    }
    
    func reachabilityChanged(note: NSNotification) {
        
        let reachability = note.object as! Reachability // 准备获取网络连接信息
        
        if reachability.isReachable { // 判断网络连接状态
            print("网络连接：可用")
            if reachability.isReachableViaWiFi { // 判断网络连接类型
                print("连接类型：WiFi")
                // 获取主机IP地址 192.168.31.2 小米路由器
                // strServerInternetAddrss = getHostAddress_WLAN()
                // 初始化Socket并连接，还得恢复按钮可用
                // processClientSocket(strServerInternetAddrss)
            } else {
                print("连接类型：移动网络")
                // 通过外网获取主机IP地址，并且初始化Socket并建立连接
                // getHostAddrss_GPRS()
            }
        } else {
            print("网络连接：不可用")
            DispatchQueue.main.async { // 不加这句导致界面还没初始化完成就打开警告框，这样不行
                self.alert_noNetwrok() // 警告框，提示没有网络
            }
        }
    }
    // 警告框，提示没有连接网络 *********************
    func alert_noNetwrok() -> Void {
        let alert = UIAlertController(title: "系统提示", message: "请打开网络连接", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .default, handler: nil)
        alert.addAction(cancelAction)
        self.presentVc.present(alert, animated: true, completion: nil)
    }
}
