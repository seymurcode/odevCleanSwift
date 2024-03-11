//
//  SplashViewController.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 5.03.2024.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func openMainForm(_ sender: Any) {
        let tabbarController = ViewControllerFactory.shared.makeMainTabbarBar()
        tabbarController.modalPresentationStyle = .fullScreen
        tabbarController.modalTransitionStyle = .flipHorizontal
        self.present(tabbarController, animated: true)
    }
    
}
