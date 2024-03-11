//
//  ProductListInteractor.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 4.03.2024.
//

import UIKit

protocol ProductListBusinessLogic {
    func getProductList(request : ProductList.List.Request)
}

protocol ProductListDataStore {
    var productsResponse : ProductsResponse? { get set }
}

class ProductListInteractor: ProductListBusinessLogic, ProductListDataStore {
    var productsResponse: ProductsResponse? = nil
    var presenter : ProductListPresentationLogic?
    var worker : ProductApiWorker?
    
    func getProductList(request : ProductList.List.Request) {
        worker = ProductApiWorker()
        worker?.getProductList(completion: { (response, error) in
            self.productsResponse = response
            
            let presentationResponse = ProductList.List.Response(productDetailResponse: response)
            self.presenter?.present(response: presentationResponse)
        })
    }
}
