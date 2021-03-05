//
//  LoginViewController.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 2/28/21.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController, UIScrollViewDelegate {

    var logInView: LoginView!
    let preferences1 = UserDefaults.standard
    var savedUserArr = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true);
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        setupView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.navigationBar.barTintColor = .blue
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        self.addKeyboardObserver()
        
    }
    
    func setupView(){
        let loginView = LoginView(frame: self.view.frame)
        self.logInView = loginView
        self.logInView.signUpAction = signUpPressed
        self.logInView.logInHomeScreen = homeScreenPressed
        
        self.view.addSubview(logInView)
       
        logInView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0)

    }
    
    func signUpPressed(){
       
        let regController = RegistrationViewController()
        self.navigationController?.pushViewController(regController, animated: true)
     
    }
    
    func homeScreenPressed(){
        
        let fromEmail: String = preferences1.string(forKey: "Uemail")!
        let fromPass: String = preferences1.string(forKey: "upass")!
        
        print("tikki", fromEmail)

        guard let email = logInView.email.text else {
            return
        }

        guard let password = logInView.pword.text else {
            return
        }

        if(email.isEmpty || password.isEmpty){
            let alertController = UIAlertController(title: "", message:
                "All fields are required", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)

        } else if(isValidEmail(email) == false){
            let alertController = UIAlertController(title: "", message:
                "Email is not valid", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        } else {

            if (email == fromEmail && password == fromPass){
                
                let alert = UIAlertController(title: "",
                message: "Login Successful",
                preferredStyle: .alert)
                
                let okay = UIAlertAction(title: "Ok", style: .default, handler: {_ in
                    CATransaction.setCompletionBlock({
                        let tabBarController = TabBarViewController()
                        self.navigationController?.pushViewController(tabBarController, animated: true)
                    })
                })
                alert.addAction(okay)
               self.present(alert, animated: true, completion: nil)
                
            } else{
                let alertController = UIAlertController(title: "", message:
                    "Invalid Email or Password", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }

        }
       
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
   override func viewWillDisappear(_ animated: Bool) {
       self.removeKeyboardObserver()
   }
}

