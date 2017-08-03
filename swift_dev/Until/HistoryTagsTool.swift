//
//  HistoryTagsTool.swift
//  swift_dev
//
//  Created by ddSoul on 2017/8/3.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.


import UIKit

class HistoryTagsTool: NSObject {
    var dbQueue: FMDatabaseQueue?
    /// 单例
    static let shareInstance: HistoryTagsTool = HistoryTagsTool()
    override init() {
        super.init()
        openDB(name: "tags.sqlite")
    }
    
    ///获取用户信息
    func getUserInfo(byId id:Int) -> String{
        
        /// 查询语句
        let sql2 = "SELECT id, tag FROM t_tags;"
        // 1.查询数据库
        let result = db!.executeQuery(sql2, withArgumentsIn: nil)
        
        // 2.从结果集中取出数据
        while (result?.next())!
        {
            let id = result?.int(forColumn: "id")
            let tag = result?.string(forColumn: "tag")
            print("___________result:\(String(describing: id)), \(String(describing: tag))")
        }
        
        return "_____select_____result"
    }
    
    
    func saveUserInfo(tag:String,id:Int) -> Bool {
        
        
        let sql = "INSERT INTO t_tags \n" +
            "(tag,id) \n" +
            "VALUES \n" +
        "(?, ?);"
        //SQLiteManager.shareInstance.db?.executeUpdate(sql, withArgumentsInArray: nil)
        db?.executeUpdate(sql, withArgumentsIn: [tag, id])
        return true
    }
    
    var db: FMDatabase?
    func openDB(name: String)
    {
        // 1.拼接路径
        let path = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!).appendingPathComponent("tags.sqlite").absoluteString
        
        print("Path:::\(path)")
        
        // 2.创建数据库对象
        db = FMDatabase(path: path)
        
        // 3.打开数据库
        // open()特点: 如果数据库文件不存在就创建一个新的, 如果存在就直接打开
        if !db!.open()
        {
            print("________打开数据库失败")
            return
        }
        
        // 4.创建表
        if !createTable()
        {
            print("________创建数据库失败")
            return
        }
    }
    
    /**
     创建表
     */
    fileprivate func createTable() ->Bool
    {
        // 1.编写SQL语句
        let sql = "CREATE TABLE IF NOT EXISTS t_tags(id TEXT PRIMARY KEY NOT NULL,tag TEXT);"
        
        // 2.执行SQL语句
        // 注意: 在FMDB中, 除了查询以外的操作都称之为更新
        return db!.executeUpdate(sql, withArgumentsIn: nil)
    }
    
    


}
