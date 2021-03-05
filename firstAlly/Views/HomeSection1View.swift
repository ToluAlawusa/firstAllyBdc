//
//  HomeSection1View.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 3/3/21.
//

import UIKit

class HomeSection1View: UIView {

   override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
     
   }
     
    
   func setup() {
        
        let stackV = pageTwoStackView()
        addSubview(stackV)
        stackV.setAnchor(width: self.frame.width, height: 50)
        stackV.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackV.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
       
   }
    
   let notiImage: UIImageView = {
        let imageName = UIImage(systemName: "bell.fill")!
        let img = UIImageView(image: imageName)
        img.tintColor = UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0)
        img.contentMode = .right
        img.clipsToBounds = true
        img.setAnchor(width: 17, height: 18)
     
        return img
   }()
    
   func horiStack() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [notiImage])

        stackV.axis = .horizontal
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
    
        return stackV
   }
    
   let Label2: UILabel = {
        
        let bilb = UILabel()
//     bilb.text = "Welcome back, Michael Ajah"
        bilb.numberOfLines = 0
        bilb.textAlignment = .left
        bilb.textColor =  UIColor(red:195.0/255.0, green:171.0/255.0, blue:66.0/255.0, alpha:1.0)
        bilb.font = UIFont(name: "Helvetica", size: 13.0)!
        bilb.setAnchor(width: 142, height: 14)
    
        return bilb
   }()

   func pageTwoStackView() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [horiStack(), Label2])
        stackV.axis = .vertical
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
        stackV.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 40)
        stackV.isLayoutMarginsRelativeArrangement = true
     
        return stackV
   }
     
   
   required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
   }

}
