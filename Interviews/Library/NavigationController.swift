//
//  Extension.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import UIKit

class NavigationController {

    let navigationController: UINavigationController
    private let statusBarView = UIView()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func setInit() {
        navigationController.view.addSubview(statusBarView)
    }

    func setStatusBarColor(alpha: CGFloat) {
        var statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = navigationController.view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        statusBarView.frame = statusBarFrame
        statusBarView.backgroundColor = UIColor.navBarColor
        statusBarView.alpha = alpha

    }

}


