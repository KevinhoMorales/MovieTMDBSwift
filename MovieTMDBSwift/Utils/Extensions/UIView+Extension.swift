//
//  UIView+Extension.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit

extension UIView {
    func setGradientBackground(colorTops: UIColor, colorBottoms: UIColor) {
        
        let colorTop =  UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.1).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom, colorTop, colorBottom]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    func setCard() {
        self.layer.cornerRadius = 5
    }
}
