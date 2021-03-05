//
//  SendMoneyView.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class SendMoneyView: UIView, UITextFieldDelegate {
    
    var pMethodScreenAction: (() -> Void)?
    var nextScreenAction: (() -> Void)?
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
     
        amount.delegate = self
        
        amount.layer.masksToBounds = true
        amount.layer.borderColor = UIColor.black.cgColor
        amount.layer.borderWidth = 1.0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(goToPaymentMethod))
        dropdownImage.isUserInteractionEnabled = true
        dropdownImage.addGestureRecognizer(tap)
        
     
    }
     
    func setup() {
        
        let stackV = pageTwoStackView()
        
        addSubview(stackV)
    
        backgroundColor = UIColor.black
        stackV.layer.cornerRadius = 20
        stackV.setAnchor(width: self.frame.width - 40, height: 310)
        
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        stackV.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackV.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stackV.heightAnchor.constraint(equalToConstant: 310).isActive = true
       
    }
   

    let Label1: UILabel = {
        let bilb = UILabel()
        bilb.text = "Amount"
        bilb.textColor =  UIColor.white
        bilb.font = UIFont(name: "Helvetica", size: 14.0)!
        bilb.textAlignment = .left
        return bilb
    }()
     
  
     
     let amount: UITextField = {
         let tfield = UITextField()
         tfield.placeholder = "Enter Amount"
         tfield.layer.cornerRadius = 5
         tfield.backgroundColor = UIColor.white
         tfield.textColor =  UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0)
         tfield.font = UIFont.systemFont(ofSize: 15)
         tfield.autocorrectionType = .no
         tfield.autocapitalizationType = .none
         tfield.keyboardType = .numberPad
         tfield.doneAccessory = true
         tfield.setAnchor(width: 0, height: 50)

         if let myImage = UIImage(systemName: "nairasign.circle"){
             tfield.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.white)
         }
         
         return tfield
     }()
    
    let beneLabel: UILabel = {
        let bilb = UILabel()
        bilb.text = "Select Beneficiary"
        bilb.textColor =  UIColor.white
        bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
        bilb.textAlignment = .left
        return bilb
    }()
     
    let cardImage: UIImageView = {
     let imageName = UIImage(systemName: "creditcard.fill")!
        let img = UIImageView(image: imageName)
        img.tintColor = UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0)
        img.contentMode = .right
        img.clipsToBounds = true
        img.setAnchor(width: 29, height: 60)
     
        return img
    }()
    
    lazy var Label2: UILabel = {
        let bilb = UILabel()
        bilb.text = "Tayo Adigun"
        bilb.textColor =  UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0)
        bilb.font = UIFont(name: "Helvetica", size: 14.0)!
        bilb.textAlignment = .left

        return bilb
    }()
    
    let dropdownImage: UIImageView = {
     let imageName = UIImage(systemName: "arrowtriangle.down.fill")!
        let img = UIImageView(image: imageName)
        img.tintColor = UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0)
        img.contentMode = .right
        img.clipsToBounds = true
        img.setAnchor(width: 29, height: 50)
     
        return img
    }()
  
     
    func horiStack() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [cardImage,Label2,dropdownImage])

        stackV.axis = .horizontal
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
        stackV.backgroundColor = .white
        stackV.layer.cornerRadius = 10
        
        stackV.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        stackV.isLayoutMarginsRelativeArrangement = true
        
        stackV.layer.masksToBounds = true
        stackV.layer.borderColor = UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0).cgColor
        stackV.layer.borderWidth = 1.0
       
      
        return stackV
    }

 
     let continueBtn: UIButton = {
         let nxtBtn = UIButton()
         let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Send", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 18.0)!, .foregroundColor: UIColor.white]))
         nxtBtn.setAttributedTitle(attributedString, for: .normal)
         nxtBtn.layer.cornerRadius = 25
         nxtBtn.backgroundColor = UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0)
         nxtBtn.setAnchor(width: 0, height: 50)
        nxtBtn.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
         
         return nxtBtn
     }()
     
    
    
    
    func pageTwoStackView() -> UIStackView {
     let stackV = UIStackView(arrangedSubviews: [Label1, amount, beneLabel, horiStack(), continueBtn])
        
        stackV.axis = .vertical
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
     
        stackV.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
        stackV.isLayoutMarginsRelativeArrangement = true
     
        return stackV
    }
    
    @objc func goToNextScreen(){
        nextScreenAction?()
    }
    
    @objc func goToPaymentMethod(){
        pMethodScreenAction?()
    }
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //to hide the keyboard
        //call any of your functions
       print("return ooo")
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if ((string == "0" || string == "") && (textField.text! as NSString).range(of: ".").location < range.location) {
                return true
            }

            // First check whether the replacement string's numeric...
            let cs = NSCharacterSet(charactersIn: "0123456789.").inverted
            let filtered = string.components(separatedBy: cs)
            let component = filtered.joined(separator: "")
            let isNumeric = string == component

            // Then if the replacement string's numeric, or if it's
            // a backspace, or if it's a decimal point and the text
            // field doesn't already contain a decimal point,
            // reformat the new complete number using
            if isNumeric {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.maximumFractionDigits = 8
                // Combine the new text with the old; then remove any
                // commas from the textField before formatting
                let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
                let numberWithOutCommas = newString.replacingOccurrences(of: ",", with: "")
                let number = formatter.number(from: numberWithOutCommas)
                if number != nil {
                    var formattedString = formatter.string(from: number!)
                    // If the last entry was a decimal or a zero after a decimal,
                    // re-add it here because the formatter will naturally remove
                    // it.
                    if string == "." && range.location == textField.text?.count {
                        formattedString = formattedString?.appending(".")
                    }
                    textField.text = formattedString
                } else {
                    textField.text = nil
                }
            }
            return false

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
