//
//  launchScreenView.swift
//  firstAlly
//
//  Created by Tolu Alawusa on 2/28/21.
//

import UIKit

class launchScreenView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
     
    }
    
    func setup() {
        
        let stackV = pageTwoStackView()
        addSubview(stackV)
        backgroundColor = UIColor.black
        stackV.setAnchor(width: self.frame.width - 40, height: 50)
        stackV.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackV.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
       
    }
    
    let logoImage: UIImageView = {
        let imageName = UIImage(named: "firstAllyLogo.png")!
        let img = UIImageView(image: imageName)
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
        img.setAnchor(width: 200, height: 50)
     
        return img
    }()
    
    func pageTwoStackView() -> UIStackView {
        let stackV = UIStackView(arrangedSubviews: [logoImage])
        stackV.axis = .vertical
        stackV.distribution = .fillProportionally
        stackV.spacing = 20
        
        return stackV
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
