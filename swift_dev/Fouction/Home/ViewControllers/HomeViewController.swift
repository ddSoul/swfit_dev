//
//  HomeViewController.swift
//  swift_dev
//
//  Created by ddSoul on 2017/6/12.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController ,AnimationBeat, UITableViewDelegate, UITableViewDataSource{
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        loadDataSource()
    }
    
    func setUpViews() {
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(pageView)
        self.view.addSubview(mainTable)
        
        pageView.snp.makeConstraints{ (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(64)
            make.height.equalTo(44)
        }
        mainTable.snp.makeConstraints{ (make) in
            make.left.right.equalTo(view)
            make.bottom.equalTo(-49)
            make.top.equalTo(pageView.snp.bottom).offset(0)
        }
    }
    
    // MARK: - tableView Delegate && tableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(mainArray.count)
        return mainArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "mainCell"
        let cell = HomeNewsCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        let hModel:HomeTopic = mainArray[indexPath.row]
        cell.homeTopicModel = hModel
        return cell
    }
    
    // MARK: - 修改table偏移
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mainTable.contentInset = UIEdgeInsets.zero
        mainTable.scrollIndicatorInsets = UIEdgeInsets.zero
        
    }

    func loadDataSource() {
        
        XLNetWorkTool.loadNetWorkHomeListData { (result) in
            print("result:\(result)");
            for value in result {
                self.mainArray.append(value)
            }
            self.mainTable.reloadData()
        }
    }
    
    // MARK: - setter,getter
    fileprivate lazy var mainTable: UITableView = {
    
       let mainTable = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.grouped)
        mainTable.delegate = self
        mainTable.dataSource = self
        mainTable.estimatedRowHeight = 44
        mainTable.rowHeight = UITableViewAutomaticDimension
        mainTable.backgroundColor = UIColor.white
        mainTable.register(HomeNewsCell.self, forCellReuseIdentifier: "mainCell")
        return mainTable
    }()
    
    fileprivate lazy var pageView: XLTopHomeView = {
        let pageView = XLTopHomeView()
        return pageView
    }()
    
    fileprivate lazy var mainArray:[HomeTopic] = {
        let mainArray = [HomeTopic]()
        return mainArray
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
