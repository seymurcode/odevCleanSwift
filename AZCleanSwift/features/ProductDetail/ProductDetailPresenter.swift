//
//  ProductDetailPresenter.swift
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

protocol ProductDetailPresentationLogic
{
  func present(response: ProductDetail.GetDetailData.Response)
  func present(response: ProductDetail.AddFavorite.Response)
  func present(response: ProductDetail.AddBasket.Response)
}

class ProductDetailPresenter: ProductDetailPresentationLogic
{

    
  weak var viewController: ProductDetailDisplayLogic?
  
  
  func present(response: ProductDetail.GetDetailData.Response)
  {
      let product=response.productResponse
      let viewModel = ProductDetail.GetDetailData.ViewModel(title: product?.title! ?? "", desc: product?.description ?? "",
                                                            priceMain: String(product?.price ?? 0), priceOld: String(product?.price ?? 0), hasFav: response.hasFav ?? false, hasBas: response.hasBas ?? false, images: (product?.images ?? nil)!, productId: String(product?.id ?? 0), discount: String(Int(product?.discountPercentage ?? 0)))
      viewController?.display(viewModel: viewModel)
  }
    
    func present(response: ProductDetail.AddFavorite.Response) {
        let imageName=response.hasFav ? "isFavorite1" : "isFavorite0"
        let text=response.hasFav ? "Favoriye Eklendi" : "Favoriden Çıkarıldı"
        viewController?.displayFav(viewModel: ProductDetail.AddFavorite.ViewModel(hasFav: UIImage(named: imageName)!, requestMessage: text))
    }
    
    func present(response: ProductDetail.AddBasket.Response) {
        viewController?.displayBas(viewModel: ProductDetail.AddBasket.ViewModel(requestMessage: "Favoriye Eklendi"))

    }
}
