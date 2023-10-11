//
//  ShopDetailCell.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import UIKit

class ShopOrderCell: UITableViewCell {

    static let identifier = "ShopOrderCell"

    private let titlelLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setData(_ data: PreOrderModel?) {

        guard let data = data else {
            return
        }

        titlelLabel.text = data.title
        subTitleLabel.text = data.description

    }

    private func setView() {
        contentView.addSubview(titlelLabel)
        contentView.addSubview(subTitleLabel)
    }

    private func setLayout() {
        titlelLabel.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: contentView.leftAnchor, width: 60, height: 50)
        subTitleLabel.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: titlelLabel.rightAnchor, right: contentView.rightAnchor, leftPadding: 5, rightPadding: 20)
    }

}
