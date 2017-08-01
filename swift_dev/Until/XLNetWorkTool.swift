//
//  XLNetWorkTool.swift
//  swift_dev
//
//  Created by Pactera_Admin on 2017/7/26.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit
import Alamofire

class XLNetWorkTool: NSObject {
    
    /*首页数据*/
    /*获取首页列表数据*/
    class func loadHomeListData(competionHandler:@escaping(_ listString:[NSString])->()) {
        var titles = [String]()
        for _ in 1...5 {
            titles.append("Coder")
        }
        competionHandler(titles as [NSString])
    }
    
    /**/
    /*获取首页列表数据*/
    class func loadNetWorkHomeListData(page:Int,competionHandler:@escaping(_ listString:[HomeTopic])->()) {
        SVProgressHUD.show()
        let pageString = "\(page)"
        let url = "http://wangyi.butterfly.mopaasapp.com/news/api?type=war&page=" + pageString + "&limit=10"
        Alamofire.request(url, parameters: nil).responseJSON { (response) in
            SVProgressHUD.dismiss()
            guard response.result.isSuccess else {
                print("result is Null")
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                /** 数组容器*/
                var models = [HomeTopic]()
                
                let topics = json["list"].array
                for topic in topics! {
                    /** JSON转模型 */
                    let homeTopicM = HomeTopic()
                    homeTopicM.parseData(json: topic)
                    models.append(homeTopicM)
                }
                competionHandler(models)
            }
        }
    }

}
