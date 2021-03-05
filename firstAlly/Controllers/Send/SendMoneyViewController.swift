//
//  SendMoneyViewController.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class SendMoneyViewController: UIViewController {

    var sendMoney: SendMoneyView!
    var home4View: HomeSection4View!
    
    let preferences1 = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferences1.removeObject(forKey: "newCheckRadio")
        
        title = "Transfer Money"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
                setupView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.barTintColor = UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0)
        self.navigationController?.isNavigationBarHidden = false
        self.addKeyboardObserver()
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(getSelectedRadio), name: Notification.Name("getSelected"), object: nil)
        nc.addObserver(self, selector: #selector(getSelectedRadio2), name: Notification.Name("getSelected2"), object: nil)

    }
    
    func setupView(){
        let sendM = SendMoneyView(frame: self.view.frame)
        self.sendMoney = sendM
        self.sendMoney.pMethodScreenAction = getBene
        self.sendMoney.nextScreenAction = nextPressed
        
        let h4V = HomeSection4View(frame: self.view.frame)
        self.home4View = h4V
        
        self.view.addSubview(sendMoney)
       
        sendMoney.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)

    }
    

    func dismissReceiveModal(){
        dismiss(animated: true, completion: nil)
    }
    
 
    
    @objc func getSelectedRadio(){
    
    self.sendMoney.Label2.text! = "Tola Bucknor"
        preferences1.set(self.sendMoney.Label2.text!, forKey: "newCheckRadio")
       print("got it selected")
    }
    
    @objc func getSelectedRadio2(){
    
    self.sendMoney.Label2.text! = "Tayo Adigun"
        preferences1.set(self.sendMoney.Label2.text!, forKey: "newCheckRadio")
       print("got it selected2")
    }
    
    func getBene(){
        
        let pMController = BeneListViewController()
        self.present(pMController, animated: true, completion: nil)
    }
  
    func nextPressed(){

        guard var amount = sendMoney.amount.text else {
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
 
            preferences1.set(amount, forKey: "sendAmount")
            let walletbal = preferences1.string(forKey: "uwallet")!
            
            print("elo",amount, walletbal)

            
            if(Int(walletbal)! < Int(amount)!){
                let alertController = UIAlertController(title: "", message:
                    "Wallet balance insufficient for the transaction", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                let newWallBAl = Int(walletbal)! - Int(amount)!
                preferences1.set(newWallBAl, forKey: "uwallet")
                let cfController = TabBarViewController()
                self.navigationController?.pushViewController(cfController, animated: true)
            }
          
        }
    }

   override func viewWillDisappear(_ animated: Bool) {
       self.removeKeyboardObserver()
   }
    
}


