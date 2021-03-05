//
//  HomeViewController.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class HomeViewController: UIViewController {

 
    let h1 = HomeSection1ViewController()
    let h2 = HomeSection2ViewController()
    let h3 = HomeSection3ViewController()
    let h4 = HomeSection4ViewController()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red:243.0/255.0, green:243.0/255.0, blue:243.0/255.0, alpha:1.0)
    }
    
    func addFixUpVC() {
        addChild(h1)
        addChild(h2)
        addChild(h3)
        addChild(h4)
        view.addSubview(h1.view)
        view.addSubview(h2.view)
        view.addSubview(h3.view)
        view.addSubview(h4.view)
        h1.didMove(toParent: self)
        h2.didMove(toParent: self)
        h3.didMove(toParent: self)
        h4.didMove(toParent: self)
        fixUpVCConstraints()
        trasacGridVCConstraints()
        dashMenuGridVCConstraints()
        h4VCConstraints()
    }
    
    func fixUpVCConstraints() {
        h1.view.translatesAutoresizingMaskIntoConstraints = false
        h1.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20).isActive = true
        h1.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        h1.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        h1.view.heightAnchor.constraint(equalToConstant: 176).isActive = true
    }
    
    func trasacGridVCConstraints() {
        h2.view.translatesAutoresizingMaskIntoConstraints = false
        h2.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110).isActive = true
        h2.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        h2.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        h2.view.heightAnchor.constraint(equalToConstant: 152).isActive = true
    }
    
    func dashMenuGridVCConstraints() {
        h3.view.translatesAutoresizingMaskIntoConstraints = false
        h3.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 280).isActive = true
        h3.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        h3.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        h3.view.heightAnchor.constraint(equalToConstant: 120).isActive = true
//        dashMenuGrid.view.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
    
    func h4VCConstraints() {
        h4.view.translatesAutoresizingMaskIntoConstraints = false
        h4.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 410).isActive = true
        h4.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        h4.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        h4.view.heightAnchor.constraint(equalToConstant: 120).isActive = true
//        dashMenuGrid.view.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addFixUpVC()
        navigationController?.navigationBar.barTintColor = UIColor(red:12.0/255.0, green:74.0/255.0, blue:175.0/255.0, alpha:1.0)
        self.navigationItem.setHidesBackButton(true, animated: true);
        self.navigationController?.isNavigationBarHidden = true
        setNeedsStatusBarAppearanceUpdate()

    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default //.default for black style
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setStatusBar(backgroundColor: UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0))
        self.navigationController?.navigationBar.setNeedsLayout()
    }
    

}
