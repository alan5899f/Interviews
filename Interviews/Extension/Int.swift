//
//  Int.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import Foundation

extension Int {

    func toString() -> String {
        return "\(self)"
    }

    func toTimeString() -> String {
        return String(format: "%02d", self)
    }

    func toAbs() -> Int {
        return abs(self)
    }

}
