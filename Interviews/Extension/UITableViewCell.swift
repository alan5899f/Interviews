//
//  UITableViewCell.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import Foundation
import UIKit

extension UITableViewCell {

    func addDashedBottomBorder() {

        let color = UIColor.lightGray.cgColor

        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: 0)

        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width / 2, y: frameSize.height)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineJoin = .round
        shapeLayer.lineDashPhase = 3.0 // Add "lineDashPhase" property to CAShapeLayer
        shapeLayer.lineDashPattern = [3, 6]
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: shapeRect.height, width: shapeRect.width, height: 0), cornerRadius: 0).cgPath

        self.layer.addSublayer(shapeLayer)
    }

}
