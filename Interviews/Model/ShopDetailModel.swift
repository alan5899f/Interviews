//
//  ShopDetailModel.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import Foundation

struct ShopDetailModel: Decodable {
    
    var payments: PaymentsModel?
    var shippings: ShippingsModel?
    var pre_order: PreOrderModel?

}
