//
//  HomeSection3ViewController.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class HomeSection3ViewController: UIViewController {

    var homeSec3View: HomeSection3View!
    let preferences1 = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupView()
        
    }
  
    func setupView(){
        let homeSec3V = HomeSection3View(frame: self.view.frame)
        self.homeSec3View = homeSec3V

        self.view.addSubview(homeSec3View)
       
        homeSec3View.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)

    }

}
