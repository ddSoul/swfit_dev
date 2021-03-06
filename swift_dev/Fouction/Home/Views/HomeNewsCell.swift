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
        self.iconImageView.addSubview(contentLabel)
        
        iconImageView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
            make.height.equalTo(150)
        }
        contentLabel.snp.makeConstraints{ (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(30)
        }
    }
    
    var thumbImageURL: String? {
        didSet {
            guard (thumbImageURL != nil) else {
                contentLabel.text = "泡沫"
                return
            }
            contentLabel.text = thumbImageURL;
        }
    }
    var homeTopicModel: HomeTopic? {
        didSet {
            guard (homeTopicModel != nil) else {
                contentLabel.text = "泡沫"
                iconImageView.image = UIImage.init(named: "tab_licai_s")
                return
            }
            contentLabel.text = homeTopicModel?.title;
            let url = URL(string: (homeTopicModel?.imgurl)!)
            print("url____:\(String(describing: url))")
            if (url == nil) {
                iconImageView.kf.setImage(with: ImageResource.init(downloadURL: URL(string: "https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=489325889,386963304&fm=173&s=8C8043972109B2E6419A14A60300F00A&w=218&h=146&img.JPEG")!))
                return
            }
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
