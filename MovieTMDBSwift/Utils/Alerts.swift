//
//  Alerts.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit

final class Alerts {
    static public func warning(title: String, buttonTitle: String, viewcontroller: MainViewController) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        viewcontroller.present(alert, animated: true, completion: nil)
    }
}
