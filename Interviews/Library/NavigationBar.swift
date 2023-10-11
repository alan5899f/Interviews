//
//  NavigationBar.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import Foundation
import UIKit

class NavigationBar {

    var backHandle: Completion = { }
    var homeHandle: Completion = { }
    var shopHandle: Completion = { }

    private lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 15.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        return button
    }()

    private lazy var homeBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "home"), for: .normal)
        button.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        return button
    }()

    private lazy var shopBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "shop"), for: .normal)
        button.addTarget(self, action: #selector(didTapShop), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        return button
    }()

    func setBackButton() -> UIBarButtonItem {
        return UIBarButtonItem(customView: backBtn)
    }

    func setHomeButton() -> UIBarButtonItem {
        return UIBarButtonItem(customView: homeBtn)
    }

    func setShopButton() -> UIBarButtonItem {
        return UIBarButtonItem(customView: shopBtn)
    }

}

// MARK: Event
extension NavigationBar {

    @objc private func didTapBack() {
        backHandle()
    }

    @objc private func didTapHome() {
        homeHandle()
    }

    @objc private func didTapShop() {
        shopHandle()
    }

}
