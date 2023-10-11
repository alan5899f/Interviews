//
//  ShopDetailCell.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import UIKit

class ShopPayCell: UITableViewCell {

    static let identifier = "ShopPayCell"

    private let titlelLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.sizeToFit()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.sizeToFit()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    private let arrowImg: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "next")
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setData(_ data: PaymentsModel?) {

        guard let data = data else {
            return
        }

        titlelLabel.text = data.title 
        subTitleLabel.text = data.options?.compactMap({$0.title}).joined(separator: " ⦁ ")

    }

    private func setView() {
        contentView.addSubview(titlelLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(arrowImg)
    }

    private func setLayout() {
        titlelLabel.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: contentView.leftAnchor, width: 60, height: 50)
        arrowImg.anchor(top: titlelLabel.topAnchor, bottom: titlelLabel.bottomAnchor, right: contentView.rightAnchor, width: 30)
        subTitleLabel.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: titlelLabel.rightAnchor, right: arrowImg.leftAnchor, leftPadding: 5, rightPadding: 20)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addDashedBottomBorder()
    }

}
