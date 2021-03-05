//
//  FundWithCardView.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class FundWithCardView: UIView, UITextFieldDelegate {
    
    var selectCardScreenAction: (() -> Void)?
    var nextScreen: (() -> Void)?
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        cardNumberField.layer.masksToBounds = true
        cardNumberField.layer.borderColor = UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0).cgColor
        cardNumberField.layer.borderWidth = 1.0
        cardNumberField.setLeftPadding(10)
        
    }
     
    func setup() {
        
        let stackV = pageTwoStackView()
        addSubview(stackV)
        stackV.layer.cornerRadius = 20
        stackV.setAnchor(width: self.frame.width - 40, height: 300)
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackV.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackV.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stackV.heightAnchor.constraint(equalToConstant: 300).isActive = true
       
    }
    
    let transacLabel: UILabel = {
        let bilb = UILabel()
        bilb.text = "Card Number"
        bilb.textColor =  UIColor.white
        bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
        bilb.textAlignment = .left
        return bilb
    }()
    
    let cardNumberField: UITextField = {
        let tfield = UITextField()
        tfield.placeholder = ""
        tfield.layer.cornerRadius = 5
        tfield.backgroundColor = UIColor.white
        tfield.textColor =  UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0)
        tfield.font = UIFont.systemFont(ofSize: 15)
        tfield.autocorrectionType = .no
        tfield.autocapitalizationType = .none
        tfield.keyboardType = .numberPad
        tfield.doneAccessory = true
        tfield.setAnchor(width: 0, height: 50)
        
        
        if let myImage = UIImage(systemName: "creditcard.fill"){
            tfield.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.white)
        }
        
        return tfield
    }()
    
    let transacHoriLabel1Left: UILabel = {
        let bilb = UILabel()
        bilb.text = "Expiry Date"
        bilb.textColor =  UIColor.white
        bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
        bilb.textAlignment = .left
        return bilb
    }()
    
    let transacHoriLabel1Right: UILabel = {
        let bilb = UILabel()
        bilb.text = "CVV"
        bilb.textColor =  UIColor.white
        bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
        bilb.textAlignment = .left
        return bilb
    }()
    
    let expiryDateField: UITextField = {
        let tfield = UITextField()
        tfield.placeholder = "mm/yy"
        tfield.layer.cornerRadius = 5
        tfield.backgroundColor = UIColor.white
        tfield.textColor =  UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0)
        tfield.font = UIFont.systemFont(ofSize: 15)
        tfield.autocorrectionType = .no
        tfield.autocapitalizationType = .none
        tfield.keyboardType = .numberPad
        tfield.contentMode = .center
        tfield.setAnchor(width: 150, height: 50)
        tfield.doneAccessory = true
        tfield.textAlignment = .center
        tfield.layer.masksToBounds = true
        tfield.layer.borderColor = UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0).cgColor
        tfield.layer.borderWidth = 1.0
       
        return tfield
    }()
    
    let cvvField: UITextField = {
        let tfield = UITextField()
        tfield.placeholder = ""
        tfield.layer.cornerRadius = 5
        tfield.backgroundColor = UIColor.white
        tfield.textColor =  UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0)
        tfield.font = UIFont.systemFont(ofSize: 15)
        tfield.autocorrectionType = .no
        tfield.autocapitalizationType = .none
        tfield.keyboardType = .numberPad
        tfield.contentMode = .center
        tfield.setAnchor(width: 150, height: 50)
        tfield.doneAccessory = true
        tfield.textAlignment = .center
        tfield.layer.masksToBounds = true
        tfield.layer.borderColor = UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0).cgColor
        tfield.layer.borderWidth = 1.0
        
        return tfield
    }()
    
    
    
    func transacHoriStack1() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [transacHoriLabel1Left, transacHoriLabel1Right])

        stackV.axis = .horizontal
        stackV.distribution = .fillProportionally
        stackV.spacing = 60
        stackV.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 60)
        stackV.isLayoutMarginsRelativeArrangement = true
       
        return stackV
    }
    
    func transacHoriStack2() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [expiryDateField, cvvField])

        stackV.axis = .horizontal
        stackV.distribution = .fillProportionally
        stackV.spacing = 60
        stackV.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        stackV.isLayoutMarginsRelativeArrangement = true
       
        return stackV
    }
    
    
    func vertiStackChild2() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [transacHoriStack1(),transacHoriStack2()])

        stackV.axis = .vertical
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
        stackV.layer.cornerRadius = 10
        
        return stackV
    }

 
     let continueBtn: UIButton = {
         let nxtBtn = UIButton()
         let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Next", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 18.0)!, .foregroundColor: UIColor.white]))
         nxtBtn.setAttributedTitle(attributedString, for: .normal)
         nxtBtn.layer.cornerRadius = 25
         nxtBtn.backgroundColor = UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0)
         nxtBtn.setAnchor(width: 0, height: 50)
        nxtBtn.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
         
         return nxtBtn
     }()
     
    
    
    
    func pageTwoStackView() -> UIStackView {
     let stackV = UIStackView(arrangedSubviews: [transacLabel, cardNumberField, vertiStackChild2(), continueBtn])
        
        stackV.axis = .vertical
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
        stackV.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
        stackV.isLayoutMarginsRelativeArrangement = true
  
        return stackV
    }
    
    @objc func goToNextScreen(){
        nextScreen?()
    }
    
    @objc func goToSelectCard(){
        selectCardScreenAction?()
    }
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //to hide the keyboard
        //call any of your functions
       print("return ooo")
        return true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

