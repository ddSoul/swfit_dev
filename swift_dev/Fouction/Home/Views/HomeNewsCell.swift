//
//  HomeNewsCell.swift
//  swift_dev
//
//  Created by Pactera_Admin on 2017/7/25.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class HomeNewsCell: UITableViewCell {

    var showImage   : UIImageView?
    var firstTitle  : UILabel?
    var subTitle    : UILabel?
    
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
        print("UI")
    }
    
    var thumbImageURL: String? {
        didSet {
            print("设置数据")
//            subTitle!.text = "45道菜谱"
//            firstTitle!.text = "世界各地大排档的招牌美食"
//            showImage!.image = UIImage.init(named: "ddddd")
        }
    }

}
