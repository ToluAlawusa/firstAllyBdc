//
//  HomeSection4ViewController.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class HomeSection4ViewController: UIViewController {

    var homeSec4View: HomeSection4View!
    var sendMoney: SendMoneyView!
    let preferences1 = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupView()
        
    }

    func setupView(){
        let homeSec4V = HomeSection4View(frame: self.view.frame)
        self.homeSec4View = homeSec4V
        
        let sendM = SendMoneyView(frame: self.view.frame)
        self.sendMoney = sendM
        
        let getAmount = preferences1.string(forKey: "sendAmount")
        
        if(getAmount == nil){
            self.homeSec4View.transacHoriLabel1Right.text = "\u{20A6}"+String(0)
            self.homeSec4View.transacHoriLabel2Right.text = "\u{20ac}"+String(0)
        } else {
            
            print("valenc", self.sendMoney.Label2.text!)
            
            if( self.sendMoney.Label2.text! == "Tola Bucknor"){
                let finalCal = Int(getAmount!)! * 4
                self.homeSec4View.transacHoriLabel2Right.text = "\u{20ac}"+String(finalCal)
                self.homeSec4View.transacHoriLabel1Right.text = "\u{20A6}"+String(0)
            } else {
                let finalCal = Int(getAmount!)! * 2
                self.homeSec4View.transacHoriLabel1Right.text = "\u{20A6}"+String(finalCal)
                self.homeSec4View.transacHoriLabel2Right.text = "\u{20ac}"+String(0)
                
            }
           
        }
        
        self.view.addSubview(homeSec4View)
       
        homeSec4View.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)

    }

}

