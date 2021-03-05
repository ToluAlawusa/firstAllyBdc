//
//  FundWithCardViewController.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class FundWithCardViewController: UIViewController, UITextFieldDelegate {

    var fWithCard: FundWithCardView!
    let preferences1 = UserDefaults.standard
    var maxLength : Int?
    var statMessage = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferences1.removeObject(forKey: "newCheckCard")
        
        view.backgroundColor = .black
        
        title = "Enter Card  Details"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        setupView()
        fWithCard.expiryDateField.delegate = self
        fWithCard.cvvField.delegate = self
        fWithCard.cardNumberField.delegate = self
        
        self.fWithCard.cardNumberField.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.fWithCard.expiryDateField.addTarget(self, action: #selector(self.changeCharacter2), for: .editingChanged)
        
    }
    
    @objc func changeCharacter(textField : UITextField){
        if fWithCard.cardNumberField.text?.utf8.count == 19 {
            self.fWithCard.expiryDateField.becomeFirstResponder()
        }
    }
    
    @objc func changeCharacter2(textField : UITextField){
        if fWithCard.expiryDateField.text?.utf8.count == 5{
            print("exp")
            self.fWithCard.cvvField.becomeFirstResponder()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0)
       
        self.navigationController?.isNavigationBarHidden = false

    }
    
    func setupView(){
        let fwCard = FundWithCardView(frame: self.view.frame)
        self.fWithCard = fwCard
        self.fWithCard.nextScreen = goToBTScreen
        
        self.view.addSubview(fWithCard)
       
        fWithCard.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)

    }
    

    func dismissReceiveModal(){
        dismiss(animated: true, completion: nil)
    }
    
    func goToBTScreen(){
        
        doFundwithCard()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == self.fWithCard.cardNumberField{
            if self.fWithCard.cardNumberField.text?.count == 4 || self.fWithCard.cardNumberField.text?.count == 9 || self.fWithCard.cardNumberField.text?.count == 14 {
                            //Handle backspace being pressed
                            if !(string == "") {
                                // append the text
                                self.fWithCard.cardNumberField.text = self.fWithCard.cardNumberField.text! + " "
                            }
                        }
//            else if textField.text!.count == 18 {
//                            self.fWithCard.expiryDateField.becomeFirstResponder()
//                        }
//           print("sCount", !(textField.text!.count > 17 + (string.count ) - range.length))
                        // check the condition not exceed 9 chars
                        return !(textField.text!.count > 18 && (string.count ) > range.length)
            
        } else if textField == self.fWithCard.expiryDateField{
            
            if self.fWithCard.expiryDateField.text?.count == 2 {
                            //Handle backspace being pressed
                            if !(string == "") {
                                // append the text
                                self.fWithCard.expiryDateField.text = self.fWithCard.expiryDateField.text! + "/"
                            }
                        }
            
            
                        // check the condition not exceed 9 chars
                        return !(textField.text!.count > 4 && (string.count ) > range.length)
                    
            //self.maxLength = 5
           
   
            
           } else if textField == self.fWithCard.cvvField{
            self.maxLength = 3
           }

           let currentString: NSString = textField.text! as NSString

           let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= self.maxLength!
   }
    

   override func viewWillDisappear(_ animated: Bool) {
       self.removeKeyboardObserver()
   }
    
    
   func doFundwithCard(){
        
        guard var card_number = fWithCard.cardNumberField.text else {
            return
        }
        guard let expiryDate = fWithCard.expiryDateField.text else {
            return
        }
        guard let cvv = fWithCard.cvvField.text else {
            return
        }
        
        let numcommas: Set<Character> = [" "]
        card_number.removeAll(where: { numcommas.contains($0) })
        
        //print("ade", card_number, expiryDate, cvv)
        
        if(card_number.isEmpty || expiryDate.isEmpty || cvv.isEmpty){
            
            let alertController = UIAlertController(title: "", message:
                "All fields are required", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
           
        } else {
            
            let  newwallet = preferences1.string(forKey: "fundAmount")
            preferences1.set(newwallet, forKey: "uwallet")
            
            let alert = UIAlertController(title: "",
            message: "Wallet Funded Successfully",
            preferredStyle: .alert)
            
            let okay = UIAlertAction(title: "Ok", style: .default, handler: {_ in
                CATransaction.setCompletionBlock({
                    let loginViewController = TabBarViewController()
                    self.navigationController?.pushViewController(loginViewController, animated: true)
                })
            })
            alert.addAction(okay)
           self.present(alert, animated: true, completion: nil)
         
        }
    }

}
