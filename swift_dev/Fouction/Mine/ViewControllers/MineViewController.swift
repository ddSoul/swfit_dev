//
//  MineViewController.swift
//  swift_dev
//
//  Created by ddSoul on 2017/8/2.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class MineViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }
    
    func setUpViews() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(mainTable)
        
        mainTable.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staicCells.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderCell
            headerCell.selectionStyle = .none
            return headerCell
        }
        let staicCell = tableView.dequeueReusableCell(withIdentifier: "staicCell") as! MineStaicCell
        staicCell.selectionStyle = .none
        let model = staicCells[indexPath.row-1]
        staicCell.model = model
        return staicCell
    }
    
    // MARK: - setter,getter
    ///table
    fileprivate lazy var mainTable: UITableView = {
        
        let mainTable = UITableView.init(frame: CGRect(), style: UITableViewStyle.plain)
        mainTable.delegate = self
        mainTable.dataSource = self
        mainTable.estimatedRowHeight = 44
        mainTable.rowHeight = UITableViewAutomaticDimension
        let nib = UINib(nibName: String(describing: MineStaicCell.self), bundle: nil)
        mainTable.register(nib, forCellReuseIdentifier: "staicCell")
        mainTable.register(HeaderCell.self, forCellReuseIdentifier: "headerCell")
        return mainTable
    }()
    ///staicCell数据
    fileprivate lazy var staicCells: [StaicCellModel] = {
        var staicCells = [StaicCellModel]()
        var staicCellModel = StaicCellModel()
        staicCellModel.contentString = "消息列表"
        staicCellModel.iconImageUrl = "Post_ReplyButton_Highlighted_50x50_"
        staicCells.append(staicCellModel)
        return staicCells
    }()


}
