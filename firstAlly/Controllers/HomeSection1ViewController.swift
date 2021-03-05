//
//  HomeSection1ViewController.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class HomeSection1ViewController: UIViewController {

    var homeSec1View: HomeSection1View!
    let preferences1 = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        setupView()
    }
    

    func setupView(){
        let homSec1V = HomeSection1View(frame: self.view.frame)
        self.homeSec1View = homSec1V
        
        let fname: String = preferences1.string(forKey: "fname")!
        let lname: String = preferences1.string(forKey: "lname")!
        
        let fullname: String =  fname+" "+lname
        
        self.homeSec1View.Label2.text = "Welcome back, "+fullname
       
        //self.homeSec1View.Label2.text = "Welcome back, Tolulope Alawusa"
        self.view.addSubview(homeSec1View)
       
        homeSec1View.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)

    }

}
