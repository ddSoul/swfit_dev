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
        openDB(name: "demo.sqlite")
    }
    
    
    /// 查询数据
    func getTags() -> String{
        
        let sql = "SELECT id, tag FROM T_Tags;"
        
        dbQueue?.inTransaction{(db, rollback) -> Void in
            
            let result = db!.executeQuery(sql, withArgumentsIn: nil)
            
            while (result?.next())!
            {
//                let id = result?.int(forColumn: "id")
                let tag = result?.string(forColumn: "tag")
                print("___tag_\(String(describing: tag))")

            }
        }
        
        return "hello"
    }
    
    /// 保存数据
    func saveTag(tag:String){
        /// DML
        let sql = "INSERT INTO T_Tags \n" +
            "(tag) \n" +
            "VALUES \n" +
            "(?);"
        // 只要使用inTransaction, 那么在inTransaction闭包中的所有代码都是在事务中执行的
        dbQueue?.inTransaction { (db, rollback) -> Void in
            
         
                db?.executeUpdate(sql, withArgumentsIn:["nihao"])
                //                if i ==  5
                //                {
                //                    // OC中的写法: *rollback = YES;
                //                    // Swift中的写法: rollback.memory = true
                //                    rollback.memory = true
                //                }
                print("保存Tag")
            
        }
    }
    
    
    
    func openDB(name: String)
    {
        // 1.拼接路径
        let path = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!).appendingPathComponent("demo.sqlite").absoluteString
        // 2.创建数据库对象
        dbQueue = FMDatabaseQueue(path: path)
        
        // 3.创建表
        createTable()
    }
    
    /**
     创建表
     */
    fileprivate func createTable()
    {
        // 1.编写SQL语句
        let sql = "CREATE TABLE IF NOT EXISTS T_Tags( \n" +
            "id INTEGER PRIMARY KEY AUTOINCREMENT, \n" +
            "tag TEXT, \n" +
");"
        
        // 2.执行SQL语句
        dbQueue?.inDatabase({ (db) -> Void in
            db?.executeUpdate(sql, withArgumentsIn: nil)
            print("creat table 成功")
        })
    }

}
