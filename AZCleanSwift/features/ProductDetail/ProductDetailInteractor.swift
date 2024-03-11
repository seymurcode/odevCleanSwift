//
//  ProductDetailInteractor.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 6.03.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ProductDetailBusinessLogic
{
  func handle(request: ProductDetail.GetDetailData.Request)
  func handle(request: ProductDetail.AddFavorite.Request)
  func handle(request: ProductDetail.AddBasket.Request)
}

protocol ProductDetailDataStore
{
  var product: Products? { get set }
}

class ProductDetailInteractor: ProductDetailBusinessLogic, ProductDetailDataStore
{
    var product: Products?
    var presenter: ProductDetailPresentationLogic?
    
    func handle(request: ProductDetail.GetDetailData.Request) {
        guard let response = self.product else {return}
        let isFav = FavoriteBasketRepository.shared.isFavorited(productId: String(product?.id ?? 0))
        let isBas = FavoriteBasketRepository.shared.isBasked(productId: String(product?.id ?? 0))
        presenter?.present(response: ProductDetail.GetDetailData.Response(productResponse: product, hasFav: isFav, hasBas: isBas))
    }
    
    func handle(request: ProductDetail.AddFavorite.Request) {
        let fav = !FavoriteBasketRepository.shared.isFavorited(productId: request.productId)
        FavoriteBasketRepository.shared.favorite(productId: request.productId, isFav: fav, product: product!)
        presenter?.present(response: ProductDetail.AddFavorite.Response(hasFav: fav))
    }
    
    func handle(request: ProductDetail.AddBasket.Request) {
        
    }
    

}