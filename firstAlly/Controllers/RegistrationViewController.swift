//
//  RegistrationViewController.swift
//
//  Created by Tolu Alawusa on 2/28/21.
//

import UIKit
import SVProgressHUD

class RegistrationViewController: UIViewController, UIScrollViewDelegate {

    var signUpView: RegistrationView!
    let preferences1 = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationItem.setHidesBackButton(true, animated: true);
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        clearUDM()
        setupView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true
        self.addKeyboardObserver()

    }
    
    func setupView(){
        let registerView = RegistrationView(frame: self.view.frame)
        self.signUpView = registerView
        self.signUpView.logInAction = goToLoginPressed
        self.signUpView.registerAction = doRegistration
        
        self.view.addSubview(signUpView)
       
        signUpView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)
    }
        
    func goToLoginPressed(){
      
        let loginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
     
    }
    
    func doRegistration(){
        
        guard let firstname = signUpView.fname.text else {
            return
        }
        guard let lastname = signUpView.lname.text else {
            return
        }
        guard let email = signUpView.email.text else {
            return
        }
        guard let phone = signUpView.phoneField.text else {
            return
        }
        
        guard let password = signUpView.pword.text else {
            return
        }
       
        if(firstname.isEmpty || lastname.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty){
            
            let alertController = UIAlertController(title: "", message:
                "All fields are required", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
            
        } else if(isValidEmail(email) == false){
            let alertController = UIAlertController(title: "", message:
                "Email is not valid", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        } else if(isValidPassword(password) == false){
            let alertController = UIAlertController(title: "", message:
                "Password should contain at least uppercase, lowercase, number, symbol and be a minumum of six(6) characters", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        else {
            
            let prewall = 0
            
            preferences1.set(firstname, forKey: "fname")
            preferences1.set(lastname, forKey: "lname")
            preferences1.set(email, forKey: "Uemail")
            preferences1.set(phone, forKey: "uphone")
            preferences1.set(password, forKey: "upass")
            preferences1.set(prewall, forKey: "uwallet")
            
            let alert = UIAlertController(title: "",
            message: "Registration Successful",
            preferredStyle: .alert)
            
            let okay = UIAlertAction(title: "Ok", style: .default, handler: {_ in
                CATransaction.setCompletionBlock({
                    let loginVC = LoginViewController()
                    self.navigationController?.pushViewController(loginVC, animated: true)
                })
            })
            alert.addAction(okay)
           self.present(alert, animated: true, completion: nil)
         
                                   
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.removeKeyboardObserver()
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        // least one uppercase,
        // least one digit
        // least one lowercase
        // least one symbol
        //  min 6 characters total
        //let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-7])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)

    }
    
    func clearUDM(){
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
    }
    
    
    
}





