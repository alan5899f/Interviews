//
//  ShopCountDownView.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import UIKit

class ShopCountDownView: UIView {

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "clock")
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let describeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.sizeToFit()
        label.text = "優惠剩餘時間1天"
        label.font = .systemFont(ofSize: 18)
        return label
    }()

    private let hourLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        return label
    }()

    private let hourLayer: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.white.cgColor
        return label
    }()

    private let colonOne: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.sizeToFit()
        label.text = ":"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    private let minuteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        return label
    }()

    private let minuteLayer: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.white.cgColor
        return label
    }()

    private let colonTwo: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.sizeToFit()
        label.text = ":"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    private let secondLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        return label
    }()

    private let secondLayer: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.white.cgColor
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setHour(_ hour: String) {
        hourLabel.pushTransition(0.7)
        hourLabel.text = hour
    }

    func setMinute(_ minute: String) {
        minuteLabel.pushTransition(0.7)
        minuteLabel.text = minute
    }

    func setSecond(_ second: String) {
        secondLabel.pushTransition(0.7)
        secondLabel.text = second
    }

    private func setView() {
        addSubview(imageView)
        addSubview(describeLabel)
        addSubview(hourLabel)
        addSubview(hourLayer)
        addSubview(colonOne)
        addSubview(minuteLabel)
        addSubview(minuteLayer)
        addSubview(colonTwo)
        addSubview(secondLabel)
        addSubview(secondLayer)
    }

    private func setLayout() {
        imageView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, width: 50, topPadding: 10, bottomPadding: 10, leftPadding: 10)
        describeLabel.anchor(top: imageView.topAnchor, bottom: imageView.bottomAnchor, left: imageView.rightAnchor, leftPadding: 10)

        hourLabel.anchor(top: imageView.topAnchor, bottom: imageView.bottomAnchor, left: describeLabel.rightAnchor, width: 40, leftPadding: 10)
        hourLayer.anchor(centerX: hourLabel.centerXAnchor, centerY: hourLabel.centerYAnchor, width: 30, height: 30)

        colonOne.anchor(top: imageView.topAnchor, bottom: imageView.bottomAnchor, left: hourLayer.rightAnchor, right: minuteLayer.leftAnchor, width: 10, leftPadding: 5, rightPadding: 5)

        minuteLabel.anchor(top: imageView.topAnchor, bottom: imageView.bottomAnchor)
        minuteLayer.anchor(centerX: minuteLabel.centerXAnchor, centerY: minuteLabel.centerYAnchor, width: 30, height: 30)

        colonTwo.anchor(top: imageView.topAnchor, bottom: imageView.bottomAnchor, left: minuteLayer.rightAnchor, right: secondLayer.leftAnchor, width: 10, leftPadding: 5, rightPadding: 5)

        secondLabel.anchor(top: imageView.topAnchor, bottom: imageView.bottomAnchor)
        secondLayer.anchor(centerX: secondLabel.centerXAnchor, centerY: secondLabel.centerYAnchor, width: 30, height: 30)
    }

}
