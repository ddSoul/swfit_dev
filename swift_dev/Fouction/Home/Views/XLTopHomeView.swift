//
//  XLTopHomeView.swift
//  swift_dev
//
//  Created by Pactera_Admin on 2017/7/24.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class XLTopHomeView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override init(frame:CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   fileprivate func setUpViews() {
        print("setUpVIews")
        self.backgroundColor = UIColor.red
    }
}


