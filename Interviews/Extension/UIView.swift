//
//  UIView.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import UIKit

extension UIView {

    func pushTransition(_ duration: CFTimeInterval) {
        let animation: CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.type = CATransitionType.push
        animation.subtype = .fromBottom
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.push.rawValue)
    }

}
