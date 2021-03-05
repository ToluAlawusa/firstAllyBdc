//
//  FundWalletEnterAmountViewController.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class FundWalletEnterAmountViewController: UIViewController {

    var fundWallet: FundWalletEnterAmountView!
    
    let preferences1 = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Fund Wallet"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
                setupView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.barTintColor = UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0)
        self.navigationController?.isNavigationBarHidden = false
        self.addKeyboardObserver()

    }
    
    func setupView(){
        let funWallet = FundWalletEnterAmountView(frame: self.view.frame)
        self.fundWallet = funWallet
        self.fundWallet.nextScreenAction = nextPressed
       
        self.view.addSubview(fundWallet)
       
        fundWallet.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)

    }
    

    func dismissReceiveModal(){
        dismiss(animated: true, completion: nil)
    }

    func nextPressed(){

        guard var amount = fundWallet.amount.text else {
            return
        }
        
        let numcommas: Set<Character> = [","]
        amount.removeAll(where: { numcommas.contains($0) })
      
        
        if(amount.isEmpty){
            let alertController = UIAlertController(title: "", message:
                "Please enter amount", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
            
        } else {
 
            preferences1.set(amount, forKey: "fundAmount")
            
            let cfController = FundWithCardViewController()
            self.navigationController?.pushViewController(cfController, animated: true)
        
        }
    }

   override func viewWillDisappear(_ animated: Bool) {
       self.removeKeyboardObserver()
   }
    
}


