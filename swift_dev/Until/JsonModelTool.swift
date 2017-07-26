//
//  JsonModelTool.swift
//  swift_dev
//
//  Created by ddSoul on 2017/7/26.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit


/** 文中的 JSON 是使用的第三方 SwiftJSON */
/** 字典转模型: json(SwiftJSON), dic(NSDictionary) */
extension NSObject {
    
    /** 只支持属性全部是 string 类型的模型,当某个属性是 NSDictionary 或者 Array 时, json[key].stringValue 会崩溃 */
    func parseData(json:JSON) {
        
        let dic = json.dictionaryValue as NSDictionary
        let keyArr:Array<String> = dic.allKeys as! Array<String>
        var propertyArr:Array<String> = []
        let hMirror = Mirror(reflecting: self)
        for case let (label?, _) in hMirror.children {
            propertyArr.append(label)
        }
        for property in propertyArr {
            for key in keyArr {
                if key == property {
                    self.setValue(json[key].stringValue, forKey: key)
                }
            }
        }
    }
    
    /** 对模型的 数组类型属性 特殊处理 */
    func parseData(json:JSON,arrayValues:Array<String>?=nil) {
        
        let dic = json.dictionaryValue as NSDictionary
        let keyArr:Array<String> = dic.allKeys as! Array<String>
        var propertyArr:Array<String> = []
        let hMirror = Mirror(reflecting: self)
        for case let (label?, _) in hMirror.children {
            propertyArr.append(label)
        }
        for property in propertyArr {
            for key in keyArr {
                if key == property {
                    for value in arrayValues! {
                        if value == property {
                            self.setValue(json[value].arrayValue, forKey: value)
                            return
                        }
                    }
                    self.setValue(json[key].stringValue, forKey: key)
                }
            }
        }
    }
    
    /**   对模型的 数组类型属性 和 description属性 特殊处理
     *    如果后台返回的参数带有 description时候,模型创建一个description会报错,故从新给description字段命名
     *  然后后传入即可,这是我想到的方法,如果有哪位有任何高见,望赐教,谢谢.
     */
    func parseData(json:JSON,arrayValues:Array<String>?=nil,descriptionName:String?=nil) {
        
        let dic = json.dictionaryValue as NSDictionary
        let keyArr:Array<String> = dic.allKeys as! Array<String>
        var propertyArr:Array<String> = []
        let hMirror = Mirror(reflecting: self)
        for case let (label?, _) in hMirror.children {
            propertyArr.append(label)
        }
        for property in propertyArr {
            for key in keyArr {
                if key == property {
                    for value in arrayValues! {
                        if value == property {
                            self.setValue(json[value].arrayValue, forKey: value)
                            return
                        }
                    }
                    self.setValue(json[key].stringValue, forKey: key)
                }
                if property == descriptionName {
                    self.setValue(json["description"].stringValue, forKey: property)
                }
            }
        }
    }
    
    /** 支持任意类型 */
    func parseData(dic:NSDictionary) {
        
        let keyArr:Array<String> = dic.allKeys as! Array<String>
        var propertyArr:Array<String> = []
        let hMirror = Mirror(reflecting: self)
        for case let (label?, _) in hMirror.children {
            propertyArr.append(label)
        }
        for property in propertyArr {
            for key in keyArr {
                if key == property {
                    self.setValue(dic[key], forKey: key)
                }
            }
        }
    }
}
