//
//  HomeSection2ViewController.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class HomeSection2ViewController: UIViewController {

    var homeSec2View: HomeSection2View!
    let preferences1 = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0)
        view.layer.cornerRadius = 20
        
        setupView()
        
    }
   
    func setupView(){
        let homeSec2V = HomeSection2View(frame: self.view.frame)
        self.homeSec2View = homeSec2V
        self.homeSec2View.showWalletBalance = toggleBalance

        self.homeSec2View.showFundWallet = showFundWallet
        self.homeSec2View.showSendFund = sendFundScreen

        self.homeSec2View.walletBalanceAmount.text = "\u{0024}"+" *******"
        
        self.view.addSubview(homeSec2View)
       
        homeSec2View.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)

    }
    
    func toggleBalance(){
      
        let walletbal = preferences1.string(forKey: "uwallet")!
        
        if (self.homeSec2View.walletToggleIcon.accessibilityIdentifier == "yes"){
            self.homeSec2View.walletToggleIcon.accessibilityIdentifier = "No"
            self.homeSec2View.walletBalanceAmount.text = "\u{0024}"+" "+String(walletbal)
            
        } else {
            self.homeSec2View.walletToggleIcon.accessibilityIdentifier = "yes"
            self.homeSec2View.walletBalanceAmount.text = "\u{0024}"+" *******"
            
        }

    }
    
    func showFundWallet(){

        let fundWController = FundWalletEnterAmountViewController()
        self.navigationController?.pushViewController(fundWController, animated: true)

    }
    
    func sendFundScreen(){

        let sMoneyController = SendMoneyViewController()
        self.navigationController?.pushViewController(sMoneyController, animated: true)

    }

}
