//
//  ScreenTool.swift
//  swift_dev
//
//  Created by Pactera_Admin on 2017/6/9.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

/// 屏幕的宽
let SCREENW = UIScreen.main.bounds.size.width
/// 屏幕的高
let SCREENH = UIScreen.main.bounds.size.height

/// iPhone 5
let isIPhone5 = SCREENH == 568 ? true : false
/// iPhone 6
let isIPhone6 = SCREENH == 667 ? true : false
/// iPhone 6P
let isIPhone6P = SCREENH == 736 ? true : false
