//
//  FavoriteRepository.swift
//  AZCleanSwift
//
//  Created by Seymur Askarov on 10.03.24.
//

import Foundation
import RealmSwift
class FavoriteBasketRepository{
    static var shared : FavoriteBasketRepository = FavoriteBasketRepository()
    
    func favorite(productId: String, isFav: Bool, product: Products){
        UserDefaults.standard.setValue(isFav, forKey: productId)

    }

    
    func basket(productId: String, isBas: Bool){
        UserDefaults.standard.setValue(isBas, forKey: productId+"Basket")
    }
    
    func isFavorited(productId: String) -> Bool{
        UserDefaults.standard.bool(forKey: productId)
    }
    func isBasked(productId: String) -> Bool{
        UserDefaults.standard.bool(forKey: productId+"Basket")
    }
}
