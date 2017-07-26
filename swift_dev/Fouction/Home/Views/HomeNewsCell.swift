//
//  HomeNewsCell.swift
//  swift_dev
//
//  Created by Pactera_Admin on 2017/7/25.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class HomeNewsCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpUI() {
        self.backgroundColor = UIColor.green
        self.addSubview(iconImageView)
        self.addSubview(contentLabel)
        
        iconImageView.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
            make.bottom.equalTo(-15)
            make.width.height.equalTo(40)
        }
        contentLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(20)
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.height.equalTo(30)
        }
        print("UI")
    }
    
    var thumbImageURL: String? {
        didSet {
            print("设置数据")
            guard (thumbImageURL != nil) else {
                contentLabel.text = "泡沫"
                return
            }
            contentLabel.text = thumbImageURL;
        }
    }
    var homeTopicModel: HomeTopic? {
        didSet {
            print("设置NetWork数据")
            guard (homeTopicModel != nil) else {
                contentLabel.text = "泡沫"
                iconImageView.image = UIImage.init(named: "tab_licai_s")
                return
            }
            contentLabel.text = homeTopicModel?.title;
            let url = URL(string: (homeTopicModel?.imgurl)!)
            iconImageView.kf.setImage(with: ImageResource.init(downloadURL: url!))
        }
    }

    fileprivate lazy var contentLabel : UILabel = {
       let contentLb = UILabel()
        contentLb.text = "iOS Coder"
        contentLb.backgroundColor = UIColor.gray
       return contentLb
    }()
    
    fileprivate lazy var iconImageView : UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage.init(named: "tab_home_s")
        return iconImageView
    }()
}
