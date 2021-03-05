//
//  BeneListViewController.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class BeneListViewController: UIViewController {
    
    var cWalletView: SendMoneyView!
    var payMethod: BeneListView!
    
    let preferences1 = UserDefaults.standard
    
    let imageNameR = UIImage(systemName: "checkmark.circle.fill")!
    let imageNameW = UIImage(systemName: "circle")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overCurrentContext
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
                setupView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = UIColor(red:12.0/255.0, green:74.0/255.0, blue:175.0/255.0, alpha:1.0)
        self.addKeyboardObserver()
        
        let cfWallet = SendMoneyView(frame: self.view.frame)
        self.cWalletView = cfWallet
        
        let chkRadio: String? =  preferences1.string(forKey: "newCheckRadio")
        
        if (chkRadio == nil){
            print("chk1", chkRadio as Any)
        } else if(chkRadio == "Tola Bucknor"){
            print("chk1", chkRadio as Any)
            self.payMethod.dropdownImage2.image = imageNameR
            self.payMethod.dropdownImage1.image = imageNameW
        } else if(chkRadio == "Tayo Adigun"){
            self.payMethod.dropdownImage1.image = imageNameR
            self.payMethod.dropdownImage2.image = imageNameW
            print("chk", chkRadio as Any)
        }
       
    }
    
    func setupView(){
        let pMethod = BeneListView(frame: self.view.frame)
        self.payMethod = pMethod
        self.payMethod.dismissModal = dismissReceiveModal
        self.payMethod.tick1 = nextPressed1
        self.payMethod.tick2 = nextPressed2
        
        
        let cWalletView = SendMoneyView(frame: self.view.frame)
        self.cWalletView = cWalletView
        
        self.view.addSubview(payMethod)
       
        payMethod.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)
        
      
    }
    

    func dismissReceiveModal(){
        
        dismiss(animated: true, completion: nil)
        print(self.cWalletView.Label2.text!)
        self.cWalletView.Label2.text! = self.cWalletView.Label2.text!
    }

    func nextPressed1(){
        
        
        if(self.payMethod.dropdownImage1.image == imageNameR){
            print("img-yes")
        } else {
            self.payMethod.dropdownImage1.image = imageNameR
            self.payMethod.dropdownImage2.image = imageNameW
            
            self.cWalletView.Label2.text! = "Tayo Adigun"
            
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.removeModal), userInfo: nil, repeats: false)
            
            let nc = NotificationCenter.default
            nc.post(name: Notification.Name("getSelected2"), object: nil)
            
            dismiss(animated: true, completion: nil)
           
        }
    }
    
    func nextPressed2(){
        
        if(self.payMethod.dropdownImage2.image == imageNameW){
            print("img-no")
            self.payMethod.dropdownImage2.image = imageNameR
            self.payMethod.dropdownImage1.image = imageNameW
            
            self.cWalletView.Label2.text! = "Tola Bucknor"
            
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.removeModal), userInfo: nil, repeats: false)
            
            let nc = NotificationCenter.default
            nc.post(name: Notification.Name("getSelected"), object: nil)
            
        } else {
           
        }

    }
    
    @objc func removeModal()
    {
       
        dismiss(animated: true, completion: nil)
      
    }
  
   override func viewWillDisappear(_ animated: Bool) {
       self.removeKeyboardObserver()
   }

}

