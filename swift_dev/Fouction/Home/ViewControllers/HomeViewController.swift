//
//  HomeViewController.swift
//  swift_dev
//
//  Created by ddSoul on 2017/6/12.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController ,AnimationBeat, UITableViewDelegate, UITableViewDataSource{

    // MARK: - protery
    var mainTable: UITableView?
    var mainArray: NSMutableArray?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTable()
        setUpViews()
        loadDataSource()
    
    }
    
    func setUpViews() {
        self.view.backgroundColor = UIColor.white
        
        self.view .addSubview(pageView)
        
        pageView.snp.makeConstraints{ (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(64)
            make.height.equalTo(44)
        }
        mainTable!.snp.makeConstraints{ (make) in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(108)
        }
    }
    
    fileprivate lazy var pageView: XLTopHomeView = {
        let pageView = XLTopHomeView()
        return pageView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - tableView Delegate && tableView DataSource
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(mainArray!.count)
        return mainArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "mainCell"
        let cell = HomeNewsCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        cell.thumbImageURL = "String"
        return cell
    }
    
    func loadDataSource() {
        mainArray = NSMutableArray.init(array: ["宝宝0", "宝宝1", "宝宝2", "宝宝3", "宝宝4", "宝宝5", "宝宝6", "宝宝7", "宝宝8", "宝宝9", "宝宝10", "宝宝11"])
        self.mainTable?.reloadData()
    }
    

    
    func setUpTable(){
        mainTable = UITableView.init(frame: CGRect(), style: UITableViewStyle.grouped)
        mainTable!.delegate = self
        mainTable!.dataSource = self
        mainTable!.backgroundColor = UIColor.white
        self.view.addSubview(mainTable!)
    }
    

}
