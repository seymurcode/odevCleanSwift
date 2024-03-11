//
//  ProductListUIData.swift
//  AZCleanSwift
//
//  Created by Seymur Askarov on 09.03.24.
//

import Foundation

struct ProductTableCellUIData {

    
    var id : Int
    var title : String
    var description : String
    var price : Int
    var priceOld : Int
    var discountPercentage : Double=0.0
    var rating : Double=0.0
    var stock : Int=0
    var brand : String
    var category : String
    var thumbnail : String
    var images : [String]

    
    init(product : Products) {
        id=product.id ?? 0
        title=product.title ?? ""
        description=product.description ?? ""
        price=product.price ?? 0
        //priceOld=Int(Double(product.price!)*(1.0+product.discountPercentage!)/100.0)
        priceOld=product.price ?? 0
        discountPercentage=product.discountPercentage ?? 0.0
        stock=product.stock ?? 0
        brand=product.brand ?? ""
        category=product.category ?? ""
        thumbnail=product.thumbnail ?? ""
        images=product.images ?? Array()
    }
}
