//
//  RegistrationView.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 2/28/21.
//

import UIKit

class RegistrationView: UIView, UIScrollViewDelegate, UITextFieldDelegate {
    
    var registerAction: (() -> Void)?
    var logInAction: (() -> Void)?
    
   
   override init(frame: CGRect) {
       super.init(frame: frame)
    
        setup()
    
        fname.delegate = self
        lname.delegate = self
        email.delegate = self
        phoneField.delegate = self
        pword.delegate = self
   

   }
   
   func setup() {
       
       let stackV = pageTwoStackView()
       addSubview(stackV)
       backgroundColor = UIColor.black
       stackV.setAnchor(width: self.frame.width - 40, height: 650)
       stackV.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
       stackV.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
      
   }
   
  
   let logoImage: UIImageView = {
       let imageName = UIImage(named: "firstAllyLogo.png")!
       let img = UIImageView(image: imageName)
       img.contentMode = .center
       img.clipsToBounds = true
       img.layer.cornerRadius = 20
       img.setAnchor(width: 123, height: 50)
    
       return img
   }()

   let Label1: UILabel = {
       let bilb = UILabel()
       bilb.text = "Get Started"
       bilb.textColor =  UIColor.white
       bilb.font = UIFont(name: "Helvetica-Bold", size: 18.0)!
       bilb.textAlignment = .left
    
       return bilb
   }()
    
   let Label2: UILabel = {
        let bilb = UILabel()
        bilb.text = "Let's create your FirstAlly Account"
        bilb.textColor =  UIColor.white
        bilb.font = UIFont(name: "Helvetica", size: 14.0)!
        bilb.textAlignment = .left

        return bilb
   }()
    
   let fname: UITextField = {
        let tfield = UITextField()
        tfield.placeholder = "First Name"
        tfield.layer.cornerRadius = 5
        tfield.backgroundColor = UIColor.white
        tfield.textColor =  UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0)
        tfield.font = UIFont.systemFont(ofSize: 15)
        tfield.autocorrectionType = .no
        tfield.setAnchor(width: 0, height: 50)
        tfield.autocapitalizationType = .none
        
        if let myImage = UIImage(systemName: "person.fill"){
            tfield.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.white)
        }
        
        return tfield
    }()
    
    let lname: UITextField = {
        let tfield = UITextField()
        tfield.placeholder = "Last Name"
        tfield.layer.cornerRadius = 5
        tfield.backgroundColor = UIColor.white
        tfield.textColor =  UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0)
        tfield.font = UIFont.systemFont(ofSize: 15)
        tfield.autocorrectionType = .no
        tfield.setAnchor(width: 0, height: 50)
        tfield.autocapitalizationType = .none
        
        if let myImage = UIImage(systemName: "person.fill"){
            tfield.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.white)
        }
        
        return tfield
    }()
    
    let email: UITextField = {
        let tfield = UITextField()
        tfield.placeholder = "e.g. johndoe@mail.com"
        tfield.layer.cornerRadius = 5
        tfield.backgroundColor = UIColor.white
        tfield.textColor =  UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0)
        tfield.font = UIFont.systemFont(ofSize: 15)
        tfield.autocorrectionType = .no
        tfield.setAnchor(width: 0, height: 50)
        tfield.keyboardType = .emailAddress
        tfield.autocapitalizationType = .none
        
        if let myImage = UIImage(systemName: "envelope.fill"){
            tfield.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.white)
        }
        
        return tfield
    }()
    
    let phoneField: UITextField = {
        let tfield = UITextField()
        tfield.placeholder = "e.g 080..."
        tfield.layer.cornerRadius = 5
        tfield.backgroundColor = UIColor.white
        tfield.textColor =  UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0)
        tfield.font = UIFont.systemFont(ofSize: 15)
        tfield.autocorrectionType = .no
        tfield.setAnchor(width: 0, height: 50)
        tfield.keyboardType = .numberPad
        tfield.doneAccessory = true
        
        if let myImage = UIImage(systemName: "phone.fill"){
            tfield.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.white)
        }
        
        return tfield
    }()
    
    let pword: UITextField = {
        let tfield = UITextField()
        tfield.placeholder = "Enter Password"
        tfield.layer.cornerRadius = 5
        tfield.backgroundColor = UIColor.white
        tfield.textColor =  UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0)
        tfield.font = UIFont.systemFont(ofSize: 15)
        tfield.autocorrectionType = .no
        tfield.setAnchor(width: 0, height: 50)
        tfield.isSecureTextEntry = true
        tfield.autocapitalizationType = .none
        
        if let myImage = UIImage(systemName: "lock.fill"){
            tfield.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.white)
        }
        
        return tfield
    }()
    
    let signUp: UIButton = {
        let nxtBtn = UIButton()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 18.0)!, .foregroundColor: UIColor.white]))
        nxtBtn.setAttributedTitle(attributedString, for: .normal)
        nxtBtn.layer.cornerRadius = 25
        nxtBtn.backgroundColor = UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0)
        nxtBtn.setAnchor(width: 0, height: 50)
        nxtBtn.addTarget(self, action: #selector(doRegistration), for: .touchUpInside)
        
        return nxtBtn
    }()
    
    lazy var Label3: UILabel = {
        let bilb = UILabel()
        bilb.text = "Already have an account? Log in"
        bilb.textColor =  UIColor.white
        bilb.font = UIFont(name: "Helvetica-Bold", size: 13.0)!
        bilb.textAlignment = .center
        let tap = UITapGestureRecognizer(target: self, action: #selector(goToLogin))
        bilb.isUserInteractionEnabled = true
        bilb.addGestureRecognizer(tap)
        
        return bilb
    }()
   
   
   func pageTwoStackView() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [logoImage, Label1, Label2, fname, lname, email,phoneField, pword, signUp, Label3])
       
        stackV.axis = .vertical
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
        stackV.layoutMargins = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        stackV.isLayoutMarginsRelativeArrangement = true
        stackV.setCustomSpacing(0.0, after: Label1)
    
        return stackV
   }
    
   @objc func goToLogin(sender:UITapGestureRecognizer){
        logInAction?()
   }
    
   @objc func doRegistration(){
       registerAction?()
   }
    
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //to hide the keyboard
        //call any of your functions
        return true
   }

   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

}

