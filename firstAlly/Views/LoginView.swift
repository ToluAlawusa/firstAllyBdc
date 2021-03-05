//
//  LoginView.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 2/28/21.
//

import UIKit

class LoginView: UIView, UITextFieldDelegate {
    
    var signUpAction: (() -> Void)?
    var logInHomeScreen: (() -> Void)?
    
   
   override init(frame: CGRect) {
       super.init(frame: frame)

       setup()
    
       email.delegate = self
       pword.delegate = self
    
       let tapp = UITapGestureRecognizer(target: self, action: #selector(goToRegister(_:)))
       Label3.isUserInteractionEnabled = true
       Label3.addGestureRecognizer(tapp)
   }
  
   func setup() {
       
       let stackV = pageTwoStackView()
       addSubview(stackV)
       backgroundColor = UIColor.black
       stackV.setAnchor(width: self.frame.width - 40, height: 500)
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
       bilb.text = "Welcome Back"
       bilb.textColor =  UIColor.white
       bilb.font = UIFont(name: "Helvetica-Bold", size: 18.0)!
       bilb.textAlignment = .left

       return bilb
   }()
    
   let Label2: UILabel = {
        let bilb = UILabel()
        bilb.text = "Please Enter Your Details to proceed"
        bilb.textColor =  UIColor.white
        bilb.font = UIFont(name: "Helvetica", size: 14.0)!
        bilb.textAlignment = .left

        return bilb
   }()
    
   let email: UITextField = {
        let tfield = UITextField()
        tfield.placeholder = "e.g. johndoe@mail.com"
        tfield.layer.cornerRadius = 5
        tfield.backgroundColor = UIColor.white
        tfield.textColor =  UIColor(red:52.0/255.0, green:76.0/255.0, blue:157.0/255.0, alpha:1.0)
        tfield.font = UIFont.systemFont(ofSize: 15)
        tfield.autocorrectionType = .no
        tfield.autocapitalizationType = .none
        tfield.keyboardType = .emailAddress
        tfield.setAnchor(width: 0, height: 50)
        
        if let myImage = UIImage(systemName: "envelope.fill"){
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
        tfield.isSecureTextEntry = true
        tfield.autocapitalizationType = .none
        tfield.autocorrectionType = .no
        tfield.setAnchor(width: 0, height: 50)
       
        if let myImage = UIImage(systemName: "lock.fill"){
            tfield.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.white)
        }
        
        var rightButton  = UIButton(type: .custom)
        rightButton.setImage(UIImage(systemName: "eye.fill") , for: .normal)
         rightButton.frame = CGRect(x:0, y:0, width:30, height:30)
         tfield.rightViewMode = .always
         tfield.rightView = rightButton
        rightButton.addTarget(self, action: #selector(toggleShowHide), for: .touchUpInside)
        
        return tfield
   }()
    
   let LogIn: UIButton = {
        let nxtBtn = UIButton()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 18.0)!, .foregroundColor: UIColor.white]))
        nxtBtn.setAttributedTitle(attributedString, for: .normal)
        nxtBtn.layer.cornerRadius = 25
        nxtBtn.backgroundColor = UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0)
        nxtBtn.setAnchor(width: 0, height: 50)
        nxtBtn.addTarget(self, action: #selector(goToHomeScreen), for: .touchUpInside)
        
        return nxtBtn
   }()
    
   lazy var Label3: UILabel = {
        let bilb = UILabel()
        bilb.text = "Dont have an account? Sign Up"
        bilb.textColor =  UIColor.white
        bilb.font = UIFont(name: "Helvetica-Bold", size: 13.0)!
        bilb.textAlignment = .center
        
        return bilb
   }()
    
   func pageTwoStackView() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [logoImage, Label1, Label2, email, pword, LogIn, Label3])
       
       stackV.axis = .vertical
       stackV.distribution = .fillProportionally
       stackV.spacing = 20
       stackV.layoutMargins = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
       stackV.isLayoutMarginsRelativeArrangement = true
       stackV.setCustomSpacing(40.0, after: logoImage)
       stackV.setCustomSpacing(0.0, after: Label3)
 
       return stackV
   }
    
   @objc func goToRegister(_ sender:UITapGestureRecognizer){
        signUpAction?()
   }
    
   
   @objc func goToHomeScreen(){
        logInHomeScreen?()
   }
    
   @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
   {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        print("gbeto", tappedImage)

   }
    
   @objc func toggleShowHide(button: UIButton) {
        print("gbeto")
        if (pword.isSecureTextEntry == true){
            pword.isSecureTextEntry = false
        } else {
            pword.isSecureTextEntry = true

        }

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


