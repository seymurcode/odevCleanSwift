//
//  ProductListPresenter.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 4.03.2024.
//

import UIKit

protocol ProductListPresentationLogic {
    func present(response : ProductList.List.Response)
}

class ProductListPresenter: ProductListPresentationLogic {
    
    weak var viewController : ProductDisplayLogic?
    
    func present(response: ProductList.List.Response) {
        var cells : [ProductList.Rows] = []
        
        let products = response.productDetailResponse?.products
        if products?.isEmpty == true {
            cells.append(ProductList.Rows.empty)
        } else {
            products?.forEach({ productItem in
                let product = ProductTableCellUIData(product: productItem)
                cells.append(ProductList.Rows.product(product: product))
            })
        }
        
        let viewModel = ProductList.List.ViewModel(rows: cells)
        viewController?.displayList(viewModel: viewModel)
    }
}
