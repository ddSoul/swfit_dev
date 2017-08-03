//
//  MineStaicCell.swift
//  swift_dev
//
//  Created by ddSoul on 2017/8/2.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class MineStaicCell: UITableViewCell {

    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    ///赋值
    var model: StaicCellModel? {
        didSet {
            guard (model != nil) else {
                contentLabel.text = "消息中心"
                iconImageView.image = UIImage.init(named: "tab_licai_s")
                return
            }
            contentLabel.text = model?.contentString
            iconImageView.image = UIImage.init(named: (model?.iconImageUrl!)!)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
