//
//  ProductListViewController.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 5.03.2024.
//

import UIKit

protocol ProductDisplayLogic : AnyObject {
    func displayList(viewModel : ProductList.List.ViewModel)
}

class ProductListViewController: UIViewController, ProductDisplayLogic {

    @IBOutlet weak var tableView : UITableView!
    
    let cellIdentifier = "ProductTableViewCell"
    var rows = [ProductList.Rows]()
    
    var interactor : (ProductListBusinessLogic & ProductListDataStore)?
    var router: ProductRoutingLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = UINib(nibName: "ProductTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: cellIdentifier)
        
        getProductList()
    }

    func displayList(viewModel: ProductList.List.ViewModel) {
        rows = viewModel.rows
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func getProductList() {
        let request = ProductList.List.Request(pageIndex: 1, pageItemCount: 10)
        interactor?.getProductList(request: request)
    }
}



extension ProductListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = rows[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: data.identifier(), for: indexPath) as? ProductCellProtocol {
            
            switch data {
                case .empty:
                break
            case .product(let product):
                cell.configure(productData: product)
                break
            }
            
            return cell as! UITableViewCell
        }
        
        return UITableViewCell()
        
    }
    
    
}


extension ProductListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let response=interactor?.productsResponse?.products{
            router?.routeToDetail(product: response[indexPath.row])
        }
    }
}
