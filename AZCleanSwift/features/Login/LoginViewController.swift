//
//  LoginViewController.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 5.03.2024.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let tabbarController = ViewControllerFactory.shared.makeMainTabbarBar()
        tabbarController.modalPresentationStyle = .fullScreen
        tabbarController.modalTransitionStyle = .flipHorizontal
        self.present(tabbarController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
