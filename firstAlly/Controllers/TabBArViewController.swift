//
//  TabBArViewController.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class TabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let homeScreenVC = UINavigationController(rootViewController: HomeViewController())
        let logoutVC = UINavigationController(rootViewController: LogoutViewController())
       
        let item1 = UITabBarItem()
        item1.title = "Home"
        item1.image = UIImage(systemName: "house.fill")
        
        let item2 = UITabBarItem()
        item2.title = "Logout"
        item2.image = UIImage(systemName: "person.fill")
        
        homeScreenVC.tabBarItem = item1
        logoutVC.tabBarItem = item2
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([homeScreenVC, logoutVC], animated: false)
        
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.edgesForExtendedLayout = .top
        present(tabBarController, animated: false, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.navigationBar.barTintColor = .blue
        self.navigationController?.isNavigationBarHidden = true
//        self.tabBarController?.tabBar.barTintColor = UIColor.black
        
        self.addKeyboardObserver()
        
    }

}

