//
//  AnimationTool.swift
//  swift_dev
//
//  Created by Pactera_Admin on 2017/6/13.
//  Copyright © 2017年 Pactera_Admin. All rights reserved.
//

import UIKit

class AnimationTool: NSObject {

}

//添加一个动画协议
protocol AnimationBeat {
}
//添加扩展
extension AnimationBeat where Self: UIView {
    //随便添加一个弹跳动画
    func animationBeat() {
        self.transform = CGAffineTransform()
        UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: UIViewKeyframeAnimationOptions(rawValue: 0), animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1 / 3.0, animations: {
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            })
            UIView.addKeyframe(withRelativeStartTime: 1 / 3.0, relativeDuration: 1 / 3.0, animations: {
                self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            })
            UIView.addKeyframe(withRelativeStartTime: 2 / 3.0, relativeDuration: 1 / 3.0, animations: {
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        }, completion: nil)
    }
}
