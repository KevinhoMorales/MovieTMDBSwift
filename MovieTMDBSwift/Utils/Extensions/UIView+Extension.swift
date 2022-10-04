//
//  UIView+Extension.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit

extension UIView {
    func setGradientBackground(colorTops: UIColor, colorBottoms: UIColor) {
        let colorTopWithAlpha = colorTops.withAlphaComponent(0.1).cgColor
        let colorBottomWithAlpha = colorBottoms.withAlphaComponent(1).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottomWithAlpha, colorTopWithAlpha, colorBottomWithAlpha]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    func setCard(cornerRadiues: Double = 5) {
        self.layer.cornerRadius = cornerRadiues
    }
    func setFilterCard() {
        self.layer.cornerRadius = 18
        self.layer.borderWidth = 0.8
        self.layer.borderColor = UIColor.labelColor().cgColor
    }
}
