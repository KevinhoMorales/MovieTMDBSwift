//
//  Coordinator.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}
    func homeView()
}
