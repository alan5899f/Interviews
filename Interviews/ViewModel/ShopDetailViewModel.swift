//
//  ShopDetailViewModel.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import UIKit

class ShopDetailViewModel {

    var shopData: ShopDetailModel = ShopDetailModel()

    func bindingStart() {

        ApiServersModel(url: ApiRouter.url).requestHttpServer { [weak self] (model: Result<ShopDetailModel, Error>) in

            switch model {
            case .success(let success):
                self?.shopData = success
            case .failure(let failure):
                print("failure", failure)
            }

        }

    }

}

