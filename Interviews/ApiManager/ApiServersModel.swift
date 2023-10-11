//
//  ApiServersModel.swift
//  GoBusNow
//
//  Created by alan on 2023/7/16.
//

import SwiftUI

protocol ApiServersProtocol {
    func requestHttpServer<T: Decodable>(completion: @escaping (Result<[T], Error>) -> Void)
}

class ApiServersModel: ApiServersProtocol {

    let url: URL?

    init(url: URL?) {
        self.url = url
    }
    
    func requestHttpServer<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {

        guard let bundlePath = url else {
            completion(.failure(ApiError.RequestUrlError("Path 路徑錯誤")))
            return
        }

        guard let jsonData = try? String(contentsOf: bundlePath).data(using: .utf8) else {
            completion(.failure(ApiError.JsonError("JSON 轉換資料錯誤")))
            return
        }

        do {

            let json = try JSONDecoder().decode(T.self, from: jsonData)
            completion(.success(json))

        }
        catch {
            completion(.failure(ApiError.JsonError("Json 資料結構錯誤")))
        }

    }

}

