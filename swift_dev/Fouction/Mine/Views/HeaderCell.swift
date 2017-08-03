//
//  HeaderCell.swift
//  swift_dev
//
//  Created by ddSoul on 2017/8/2.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

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
        self.addSubview(nickNamelabel)
        self.addSubview(accountIDlabel)
        self.addSubview(avterImageView)
        self.addSubview(scqrImageView)
        self.addSubview(rightImageView)
        
        avterImageView.snp.makeConstraints { (make) in
            make.left.top.equalTo(20)
            make.width.height.equalTo(50)
        }
        nickNamelabel.snp.makeConstraints { (make) in
            make.left.equalTo(80)
            make.top.equalTo(20)
            make.height.equalTo(20)
        }
        accountIDlabel.snp.makeConstraints { (make) in
            make.left.equalTo(80)
            make.top.equalTo(50)
            make.height.equalTo(20)
            make.bottom.equalTo(-25)
        }
        scqrImageView.snp.makeConstraints { (make) in
            make.top.equalTo(25)
            make.width.height.equalTo(40)
            make.right.equalTo(-70)
        }
        rightImageView.snp.makeConstraints { (make) in
            make.top.equalTo(30)
            make.width.equalTo(20)
            make.height.equalTo(30)
            make.right.equalTo(-30)
        }
    }
    ///头像
    fileprivate lazy var avterImageView:UIImageView = {
        let avterImageView = UIImageView()
        avterImageView.image = UIImage.init(named: "Share_WeChatSessionIcon_70x70_")
        return avterImageView
    }()
    ///账号
    fileprivate lazy var accountIDlabel:UILabel = {
        let accountIDlabel = UILabel()
        accountIDlabel.backgroundColor = UIColor.green
        accountIDlabel.text = "wexin1993"
        return accountIDlabel
    }()
    ///昵称
    fileprivate lazy var nickNamelabel:UILabel = {
        let nickNamelabel = UILabel()
        nickNamelabel.backgroundColor = UIColor.green
        nickNamelabel.text = "跳海的鱼"
        return nickNamelabel
    }()
    ///右侧箭头
    fileprivate lazy var rightImageView:UIImageView = {
        let rightImageView = UIImageView()
        rightImageView.image = UIImage.init(named: "Category_PostCollectionSeeAll_nightMode_5x8_")
        return rightImageView
    }()
    ///右侧二维码
    fileprivate lazy var scqrImageView:UIImageView = {
        let scqrImageView = UIImageView()
        scqrImageView.image = UIImage.init(named: "PlaceHolderImage_small_31x26_")
        return scqrImageView
    }()

}
