//
//  SeeTrailerButton.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit

class SeeTrailerButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupButton()
    }
    
    func setupButton() {
        setTitleColor(.whiteColor(), for: .normal)
        layer.backgroundColor = UIColor.transparentColor().cgColor
        layer.cornerRadius = CGFloat(10)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.grayColor().cgColor
        titleLabel?.font =  UIFont(name: "Poppins-Medium", size: 18)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = CGFloat(10)
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
    
}
