//
//  BeneListView.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class BeneListView: UIView, UITextFieldDelegate {
    
    var qrScreenAction: (() -> Void)?
    var dismissModal: (() -> Void)?
    
    var tick1: (() -> Void)?
    var tick2: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(doTick1))
        dropdownImage1.isUserInteractionEnabled = true
        dropdownImage1.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(doTick2))
        dropdownImage2.isUserInteractionEnabled = true
        dropdownImage2.addGestureRecognizer(tap2)
     
    }
     
     
    
    func setup() {
        
        let stackV = pageTwoStackView()
        addSubview(dismissLayerBtn)
        addSubview(stackV)
    
        stackV.backgroundColor = UIColor(red:249.0/255.0, green:249.0/255.0, blue:249.0/255.0, alpha:1.0)
        stackV.layer.cornerRadius = 20
        stackV.setAnchor(width: self.frame.width - 40, height: 200)
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        stackV.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackV.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stackV.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        dismissLayerBtn.translatesAutoresizingMaskIntoConstraints = false
        dismissLayerBtn.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -20).isActive = true
        dismissLayerBtn.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        dismissLayerBtn.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        dismissLayerBtn.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }


    let Label1: UILabel = {
        let bilb = UILabel()
         bilb.text = "Beneficiaries"
         bilb.textColor =  UIColor(red:9.0/255.0, green:32.0/255.0, blue:88.0/255.0, alpha:1.0)
         bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
         bilb.textAlignment = .center
        return bilb
    }()
    
    let cardImage1: UIImageView = {
     let imageName = UIImage(systemName: "person.fill")!
        let img = UIImageView(image: imageName)
        img.contentMode = .right
        img.clipsToBounds = true
        img.setAnchor(width: 29, height: 60)
     
        return img
    }()
    
    let cardImage2: UIImageView = {
     let imageName = UIImage(systemName: "person.fill")!
        let img = UIImageView(image: imageName)
        img.contentMode = .right
        img.clipsToBounds = true
        img.setAnchor(width: 29, height: 60)
     
        return img
    }()
    
    let transacHoriLabel1Left: UILabel = {
        let bilb = UILabel()
         bilb.text = "Tayo Adigun"
         bilb.textColor =  UIColor(red:9.0/255.0, green:32.0/255.0, blue:88.0/255.0, alpha:1.0)
         bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
         bilb.textAlignment = .left
        return bilb
    }()
    
    let dropdownImage1: UIImageView = {
        let imageName = UIImage(systemName: "checkmark.circle.fill")!
        let img = UIImageView(image: imageName)
        img.contentMode = .right
        img.clipsToBounds = true
        img.setAnchor(width: 29, height: 50)
     
        return img
    }()
    
    let transacHoriLabel2Left: UILabel = {
         let bilb = UILabel()
         bilb.text = "Tola Bucknor"
         bilb.textColor =  UIColor(red:9.0/255.0, green:32.0/255.0, blue:88.0/255.0, alpha:1.0)
         bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
         bilb.textAlignment = .left
        return bilb
    }()
    
    let dropdownImage2: UIImageView = {
        let imageName = UIImage(systemName: "circle")!
        let img = UIImageView(image: imageName)
        img.contentMode = .right
        img.clipsToBounds = true
        img.setAnchor(width: 29, height: 50)
     
        return img
    }()
    
    func transacHoriStack1() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [cardImage1, transacHoriLabel1Left, dropdownImage1])

        stackV.axis = .horizontal
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
        stackV.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        stackV.isLayoutMarginsRelativeArrangement = true
       
        return stackV
    }
    
    func transacHoriStack2() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [cardImage2, transacHoriLabel2Left, dropdownImage2])

        stackV.axis = .horizontal
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
        stackV.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        stackV.isLayoutMarginsRelativeArrangement = true
       
        return stackV
    }
    
    lazy var dismissLayerBtn: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(tapToDismiss), for: .touchUpInside)
        btn.setAnchor(width: frame.width, height: frame.height)
        return btn
    }()

    @objc func tapToDismiss() {
        dismissModal?()
    }
     
    func pageTwoStackView() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [Label1, transacHoriStack1(), transacHoriStack2()])
        
        stackV.axis = .vertical
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
        stackV.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackV.isLayoutMarginsRelativeArrangement = true
  
        return stackV
    }
    
    @objc func doTick1(){
        tick1?()
    }
    
    @objc func doTick2(){
        tick2?()
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


