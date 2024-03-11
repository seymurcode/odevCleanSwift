//
//  FavoriteApiWorker.swift
//  AZCleanSwift
//
//  Created by Seymur Askarov on 11.03.24.
//

import Foundation

func getFavoriteList(completion: @escaping ((ProductsResponse?, NetworkError?))->Void) {
   let url = "https://dummyjson.com/products"
    NetworkManager.shared.fetchData(from: url, method: .get, body: nil) { (result : Result<ProductsResponse, NetworkError>)  in
        switch result {
            case .success(let productsResponse) :
                completion((productsResponse, nil))
                break
            case .failure(let error) :
                completion((nil, error))
                break
        }
    }
}
