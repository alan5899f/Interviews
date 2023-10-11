//
//  ShopDetailHeaderView.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import UIKit

class ShopDetailHeaderView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "headerImg")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {
        addSubview(imageView)
    }

    private func setLayout() {
        imageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: Width)
    }

}
