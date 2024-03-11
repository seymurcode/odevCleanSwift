//
//  ProductListModels.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 4.03.2024.
//

import UIKit

enum ProductList {

    
    enum List {
        struct Request {
            let pageIndex : Int
            let pageItemCount : Int
        }
        struct Response {
            let productDetailResponse : ProductsResponse?
        }
        struct ViewModel {
            let rows : [Rows]
        }
    }
    
    enum Rows {
        case empty
        case product(product : ProductTableCellUIData)
        
        func identifier() -> String {
            switch self {
            case .empty:
                return "empty_cell_identifier"
            case .product:
                return "ProductTableViewCell"
            }
        }
    }

}
