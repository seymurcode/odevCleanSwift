//
//  ProductListRouter.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 5.03.2024.
//

import UIKit

protocol ProductRoutingLogic {
    func routeToDetail(product : Products)
}
class ProductListRouter: NSObject, ProductRoutingLogic {

    weak var viewController : ProductListViewController?
    
    func routeToDetail(product : Products) {
        let detail = ViewControllerFactory.shared.makeProductDetail(product : product)
        self.viewController?.navigationController?.pushViewController(detail, animated: true)
    }

}
