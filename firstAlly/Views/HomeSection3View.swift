//
//  HomeSection3View.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class HomeSection3View: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
 
    }
  
    func setup() {
        
        let stackV = pageTwoStackView()
        addSubview(stackV)
        stackV.setAnchor(width: self.frame.width, height: 110)
        stackV.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackV.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
       
    }
    
    let transacHoriLabel1Left: UILabel = {
        let bilb = UILabel()
        bilb.text = "NGN"
        bilb.textColor =  UIColor(red:9.0/255.0, green:32.0/255.0, blue:88.0/255.0, alpha:1.0)
        bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
        bilb.textAlignment = .left
        
        return bilb
    }()
    
    lazy var transacHoriLabel1Right: UILabel = {
        let bilb = UILabel()
        bilb.text = "\u{20A6}"+" 2"
        bilb.textColor =  UIColor.systemGreen
        bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
        bilb.textAlignment = .right
        
        return bilb
    }()
    
    let transacHoriLabel2Left: UILabel = {
        let bilb = UILabel()
        bilb.text = "EUR"
        bilb.textColor =  UIColor(red:9.0/255.0, green:32.0/255.0, blue:88.0/255.0, alpha:1.0)
        bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
        bilb.textAlignment = .left
        return bilb
    }()
    
    lazy var transacHoriLabel2Right: UILabel = {
        let bilb = UILabel()
        bilb.text = "\u{20ac}"+" 4"
        bilb.textColor =  UIColor.systemGreen
        bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
        bilb.textAlignment = .right

        return bilb
    }()
    
    let transacHoriLabel3Left: UILabel = {
        let bilb = UILabel()
        bilb.text = "Exchange Rates"
        bilb.contentMode = .center
        bilb.textColor =  UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0)
        bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
        bilb.textAlignment = .left

        return bilb
    }()
    
    lazy var transacHoriLabel3Right: UILabel = {
        let bilb = UILabel()
        bilb.text = "\u{20A6}"+" 4000.0"
        bilb.textColor =  UIColor(red:9.0/255.0, green:32.0/255.0, blue:88.0/255.0, alpha:1.0)
        bilb.font = UIFont(name: "Helvetica-Bold", size: 14.0)!
        bilb.textAlignment = .right
        
        return bilb
    }()
    
    func transacHoriStack1() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [transacHoriLabel1Left, transacHoriLabel1Right])

        stackV.axis = .horizontal
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
        stackV.backgroundColor = .white
        
        // new tolu
        stackV.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        stackV.isLayoutMarginsRelativeArrangement = true
       
        return stackV
    }
    
    func transacHoriStack2() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [transacHoriLabel2Left, transacHoriLabel2Right])

        stackV.axis = .horizontal
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
        stackV.backgroundColor = .white
        
        // new tolu
        stackV.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        stackV.isLayoutMarginsRelativeArrangement = true
       
        return stackV
    }
    
    func transacHoriStack3() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [transacHoriLabel3Left])

        stackV.axis = .horizontal
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
        stackV.backgroundColor = .white
        
        // new tolu
        stackV.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)
        stackV.isLayoutMarginsRelativeArrangement = true
       
        return stackV
    }
    
    
    func vertiStackChild2() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [transacHoriStack3(), transacHoriStack1(),transacHoriStack2()])

        stackV.axis = .vertical
        stackV.distribution = .fillProportionally
        stackV.backgroundColor = .white
        stackV.layer.cornerRadius = 10
        
        return stackV
    }
    
    func horiStack() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [vertiStackChild2()])

        stackV.axis = .horizontal
        stackV.distribution = .fillEqually
        stackV.spacing = 20

        return stackV
    }
  
    
    func pageTwoStackView() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [horiStack()])
        
        stackV.axis = .vertical
        stackV.distribution = .fillProportionally
        stackV.spacing = 30
        stackV.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        stackV.isLayoutMarginsRelativeArrangement = true
     
        return stackV
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
