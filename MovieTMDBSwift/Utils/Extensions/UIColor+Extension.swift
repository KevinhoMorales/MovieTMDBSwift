//
//  UIColor+Extension.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit

extension UIColor {
    class func whiteColor() -> UIColor {
        guard let color = UIColor(named: "WhiteColor") else { return UIColor.white }
        return color
    }
    class func blackColor() -> UIColor {
        guard let color = UIColor(named: "BlackColor") else { return UIColor.white }
        return color
    }
    class func grayColor() -> UIColor {
        guard let color = UIColor(named: "GrayColor") else { return UIColor.white }
        return color
    }
    class func yellowColor() -> UIColor {
        guard let color = UIColor(named: "YellowColor") else { return UIColor.white }
        return color
    }
    class func transparentColor() -> UIColor {
        guard let color = UIColor(named: "TransparentColor") else { return UIColor.white }
        return color
    }
}
