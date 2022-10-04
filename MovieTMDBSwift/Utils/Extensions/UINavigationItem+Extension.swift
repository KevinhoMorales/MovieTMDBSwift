//
//  UINavigationItem+Extension.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit

extension UINavigationItem {
    func setTitle(title: String, subtitle: String) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .labelColor()
        titleLabel.font = UIFont(name: "Poppins-Bold", size: 22)
        titleLabel.sizeToFit()
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = .labelColor()
        subtitleLabel.font = UIFont(name: "Poppins-Light", size: 10)
        subtitleLabel.textAlignment = .center
        subtitleLabel.sizeToFit()
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        stackView.alignment = .center
        
        let width = max(titleLabel.frame.size.width, subtitleLabel.frame.size.width)
        stackView.frame = CGRect(x: 0, y: 0, width: width, height: 35)
        
        titleLabel.sizeToFit()
        subtitleLabel.sizeToFit()
        self.titleView?.backgroundColor = .clear
        self.titleView = stackView
    }
}
