//
//  HomeViewController.swift
//  swift_dev
//
//  Created by ddSoul on 2017/6/12.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    let reachabilityTool = XLReachabilityTool()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sucBool = HistoryTagsTool.shareInstance.saveUserInfo(tag: "刘德华", id: 1)
        if sucBool {
            let str = HistoryTagsTool.shareInstance.getUserInfo(byId: 1)
            print("___\(str)")
        }
        // 检测网络连接状态
        reachabilityTool.NetworkStatusListener(presentVc: self)
        setupNav()
        setUpViews()
        loadDataSource()
    }
    
    func setUpViews() {
        
        self.view.addSubview(pageView)
        self.view.addSubview(mainTable)
        
        mainTable.mj_header = MJRefreshNormalHeader(refreshingBlock:{ (weakSelf) in
            print("header_MJ_refresh")
            self.loadDataSource()
        })

        mainTable.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(loadMore))
        
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
    
    /// 设置导航栏
    func setupNav() {
        view.backgroundColor = UIColor.white
        let rightItemImg = UIImage.init(named: "content-details_share_16x16_-1");
        rightItemImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightItemImg, style: .plain, target: self, action: #selector(rightItemClick))
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetailVC = DetaileViewController()
        let hModel:HomeTopic = mainArray[indexPath.row]
        productDetailVC.urlString = hModel.docurl
        navigationController?.pushViewController(productDetailVC, animated: true)
    }
    
    // MARK: - ccc
    var page = 0
    func loadMore() {
        page = page + 1
        XLNetWorkTool.loadNetWorkHomeListData (page: page){ (result) in
            print("result:\(result)")
            for value in result {
                self.mainArray.append(value)
            }
            self.mainTable.reloadData()
        }
        mainTable.mj_footer.endRefreshing()
        print("_____load___more")
    }
    
    func rightItemClick() {
        print("right Item Click")
    }
    
    func loadDataSource() {
        print("___________refresh_____header")
        XLNetWorkTool.loadNetWorkHomeListData (page: 1){ (result) in
            self.mainArray.removeAll()
            for value in result {
                self.mainArray.append(value)
            }
            self.mainTable.reloadData()
        }
        mainTable.mj_header.endRefreshing()
    }
    
    // MARK: - setter,getter
    fileprivate lazy var mainTable: UITableView = {
    
        let mainTable = UITableView.init(frame: CGRect(), style: UITableViewStyle.plain)
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
