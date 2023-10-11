//
//  PaymentsModel.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import Foundation

struct PaymentsModel: Decodable {

    var title: String?
    var options: [OptionsModel]?

    struct OptionsModel: Decodable {
        var title: String?
        var icon: String?
    }

}
