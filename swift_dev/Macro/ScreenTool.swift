//
//  ScreenTool.swift
//  swift_dev
//
//  Created by Pactera_Admin on 2017/6/9.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

/// 屏幕的宽
let ScreenW = UIScreen.main.bounds.size.width
/// 屏幕的高
let ScreenH = UIScreen.main.bounds.size.height

/// iPhone 5
let isIPhone5 = ScreenH == 568 ? true : false
/// iPhone 6
let isIPhone6 = ScreenH == 667 ? true : false
/// iPhone 6P
let isIPhone6P = ScreenH == 736 ? true : false
