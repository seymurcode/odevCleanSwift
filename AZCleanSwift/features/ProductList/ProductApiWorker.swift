//
//  ProductApiWorker.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 4.03.2024.
//

import UIKit

class ProductApiWorker {
    func getProductList(completion: @escaping ((ProductsResponse?, NetworkError?))->Void) {
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
}
