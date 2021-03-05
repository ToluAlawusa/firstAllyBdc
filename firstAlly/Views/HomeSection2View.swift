//
//  HomeSection2View.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class HomeSection2View: UIView {

    var showWalletBalance: (() -> Void)?
    var showFundWallet: (() -> Void)?
    var showSendFund: (() -> Void)?

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(showBalance(_:)))
        walletToggleIcon.isUserInteractionEnabled = true
        walletToggleIcon.addGestureRecognizer(tap)
        walletToggleIcon.accessibilityIdentifier = "yes"
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(showFundWalletScreen(_:)))
        transImage2.isUserInteractionEnabled = true
        transImage2.addGestureRecognizer(tap3)
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(showSendFundScreen(_:)))
        transImage1.isUserInteractionEnabled = true
        transImage1.addGestureRecognizer(tap4)
        
    }
     
     
    
    func setup() {
        
        let stackV = pageTwoStackView()
        addSubview(stackV)
        stackV.setAnchor(width: self.frame.width, height: 110)
        stackV.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackV.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
       
    }
    
    let transImage1: UIImageView = {
        let imageName = UIImage(systemName: "paperplane.fill")!
        let img = UIImageView(image: imageName)
        img.tintColor = UIColor.black
        img.contentMode = .center
        img.clipsToBounds = true
        img.setAnchor(width: 29, height: 23)
     
        return img
    }()
    
    let transLabel1: UILabel = {
        let bilb = UILabel()
        bilb.text = "Send Money"
        bilb.numberOfLines = 0
        bilb.textAlignment = .center
        bilb.textColor =  UIColor.black
        bilb.font = UIFont(name: "Helvetica", size: 14.0)!
        bilb.setAnchor(width: 66, height: 14)
        
        return bilb
    }()
    
    let transImage2: UIImageView = {
        let imageName = UIImage(systemName: "creditcard.fill")!
        let img = UIImageView(image: imageName)
        img.tintColor = UIColor.black
        img.contentMode = .center
        img.clipsToBounds = true
        img.setAnchor(width: 29, height: 23)
     
        return img
    }()
    
    let transLabel2: UILabel = {
        let bilb = UILabel()
     bilb.text = "Fund Wallet"
        bilb.numberOfLines = 0
        bilb.textAlignment = .center
        bilb.textColor =  UIColor.black

        bilb.font = UIFont(name: "Helvetica", size: 14.0)!
        bilb.setAnchor(width: 66, height: 14)
        return bilb
    }()
    
    func vertiStackChild1() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [transImage1,transLabel1])

        stackV.axis = .vertical
        stackV.distribution = .fillProportionally

        return stackV
    }
    
    func vertiStackChild2() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [transImage2,transLabel2])

        stackV.axis = .vertical
        stackV.distribution = .fillProportionally
   
        return stackV
    }

    
    func horiStack() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [vertiStackChild1(), vertiStackChild2()])

        stackV.axis = .horizontal
        stackV.distribution = .fillEqually
        stackV.spacing = 20
        
        return stackV
    }
    
    let walletBalanceTitle: UILabel = {
        let bilb = UILabel()
     bilb.text = "Wallet Balance"
        bilb.numberOfLines = 0
        bilb.textAlignment = .left
        bilb.textColor = UIColor.black
        bilb.font = UIFont(name: "Helvetica", size: 15.0)!
        bilb.setAnchor(width: 137, height: 20)
        return bilb
    }()
    
    let walletBalanceAmount: UILabel = {
        let bilb = UILabel()
//     bilb.text = "N110,300,000"
        bilb.numberOfLines = 0
        bilb.textAlignment = .center
        bilb.textColor =  UIColor.white
        bilb.font = UIFont(name: "Helvetica-Bold", size: 15.0)!
        bilb.setAnchor(width: 100, height: 35)
        return bilb
    }()
    
    lazy var walletToggleIcon: UIImageView = {
        
        let imageName = UIImage(systemName: "eye.slash.fill")
        let img = UIImageView(image: imageName)
        img.tintColor = UIColor.black
        img.contentMode = .center
        img.setAnchor(width: 16, height: 11)
        
        return img
    }()
    
    func horiStack2() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [walletBalanceTitle, walletBalanceAmount, walletToggleIcon])

        stackV.axis = .horizontal
        stackV.distribution = .fill
        stackV.spacing = 10
        stackV.setCustomSpacing(20.0, after: walletBalanceTitle)
        stackV.setCustomSpacing(10.0, after: walletBalanceAmount)
        stackV.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stackV.isLayoutMarginsRelativeArrangement = true
       
        return stackV
    }
    
    func pageTwoStackView() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [horiStack(), horiStack2()])
        
        stackV.axis = .vertical
        stackV.distribution = .fillProportionally
        stackV.spacing = 32
        stackV.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        stackV.isLayoutMarginsRelativeArrangement = true
     
        return stackV
    }
    
    @objc func showBalance(_ sender:UITapGestureRecognizer){
        showWalletBalance?()
    }
    
    
    @objc func showFundWalletScreen(_ sender:UITapGestureRecognizer){
        showFundWallet?()
    }
    
    @objc func showSendFundScreen(_ sender:UITapGestureRecognizer){
        showSendFund?()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
