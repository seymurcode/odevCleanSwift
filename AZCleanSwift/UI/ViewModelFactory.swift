//
//  ViewModelFactory.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 5.03.2024.
//

import UIKit

class ViewControllerFactory {
    static var shared : ViewControllerFactory = ViewControllerFactory()
    
    func makeMainTabbarBar() -> UITabBarController {
        let viewController = MyTabbarViewController(nibName: "MyTabbarViewController", bundle: nil)
        viewController.createViewControllers()
        viewController.tabBar.backgroundColor = .gray
        viewController.tabBar.tintColor = .black
        return viewController
    }
    
    func makeProductListController() -> UIViewController {
        let productListController = ProductListViewController(nibName: "ProductListViewController", bundle: Bundle.main)
        
       // let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let productListController = storyboard.instantiateViewController(withIdentifier: "ProductListViewController") as! ProductListViewController
        
        let interactor = ProductListInteractor()
        let presenter = ProductListPresenter()
        let router = ProductListRouter()
        
        productListController.interactor = interactor
        productListController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = productListController
        router.viewController=productListController
        
        return productListController
    }
    
    func makeBasketController() -> UIViewController {
        let basketController = BasketViewController(nibName: "BasketViewController", bundle: Bundle.main)
        return basketController  
    }
    
    func makeFavoriteController() -> UIViewController {
        let favController = FavoriteViewController(nibName: "FavoriteViewController", bundle: Bundle.main)
        return favController
    }

    func makeSplashController() -> UIViewController {
        let splash = SplashViewController(nibName: "SplashViewController", bundle: Bundle.main)
        return splash
    }
    
    func makeProductDetail(product : Products) -> UIViewController {
        let detail = ProductDetailViewController(nibName: "ProductDetailViewController", bundle: Bundle.main)
        
        let interactor = ProductDetailInteractor()
        let presenter = ProductDetailPresenter()
        let router = ProductDetailRouter()
        
        detail.interactor=interactor
        detail.router=router

        interactor.presenter=presenter
        interactor.product=product
        
        presenter.viewController=detail
        
        router.viewController=detail
        router.dataStore=interactor
        
        return detail
    }
}
