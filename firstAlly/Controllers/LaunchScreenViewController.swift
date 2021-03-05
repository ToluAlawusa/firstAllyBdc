//
//  LaunchScreenViewController.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 2/28/21.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    var launchScreen: launchScreenView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true);
       
       let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
       navigationController?.navigationBar.titleTextAttributes = textAttributes
               setupView()
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.removeSP), userInfo: nil, repeats: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        self.navigationController?.isNavigationBarHidden = true
      
    }
    
    func setupView(){
        let LScreen = launchScreenView(frame: self.view.frame)
        self.launchScreen = LScreen
        self.view.addSubview(launchScreen)
       
        launchScreen.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)

    }
    
    @objc func removeSP()
    {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
      
    }

}
