//
//  ShopDetailCell.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import UIKit

class ShopDeliveryCell: UITableViewCell {

    static let identifier = "ShopDeliveryCell"

    private let titlelLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.sizeToFit()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    private let subDescribeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    private let subTitleSecondLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    private let subDescribeSecondLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
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

    public func setData(_ data: ShippingsModel?) {

        guard let data = data else {
            return
        }

        titlelLabel.text = data.title
        subTitleLabel.text = data.options?[0].title
        subDescribeLabel.text = "滿$\(data.options?[0].free_threshold?.toString() ?? "")免運"

        if data.options?.count ?? 0 > 1 {
            subTitleSecondLabel.text = data.options?[1].title
            subDescribeSecondLabel.text = "滿$\(data.options?[1].free_threshold?.toString() ?? "")免運"
            subTitleSecondLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        else {
            subTitleSecondLabel.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }

    }

    private func setView() {
        contentView.addSubview(titlelLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(subDescribeLabel)
        contentView.addSubview(subTitleSecondLabel)
        contentView.addSubview(subDescribeSecondLabel)
        contentView.addSubview(arrowImg)
    }

    private func setLayout() {
        titlelLabel.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, width: 60, height: 50)
        arrowImg.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, width: 30)

        subTitleLabel.anchor(top: titlelLabel.topAnchor, bottom: titlelLabel.bottomAnchor, left: titlelLabel.rightAnchor)
        subDescribeLabel.anchor(top: titlelLabel.topAnchor, bottom: titlelLabel.bottomAnchor, left: subTitleLabel.rightAnchor, leftPadding: 15)

        subTitleSecondLabel.anchor(top: subTitleLabel.bottomAnchor, bottom: contentView.bottomAnchor, left: subTitleLabel.leftAnchor)
        subDescribeSecondLabel.anchor(top: subTitleSecondLabel.topAnchor, bottom: subTitleSecondLabel.bottomAnchor, left: subTitleSecondLabel.rightAnchor, leftPadding: 15)

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addDashedBottomBorder()
    }

}
