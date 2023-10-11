//
//  ShippingsModel.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import Foundation

struct ShippingsModel: Decodable {

    var title: String?
    var options: [OptionsModel]?

    struct OptionsModel: Decodable {
        var is_convenience_store: Bool?
        var free_threshold: Int?
        var title: String?
        var shipping_fee: Int?
    }

}
