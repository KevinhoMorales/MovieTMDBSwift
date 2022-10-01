//
//  MainCoordinator.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import Foundation

import UIKit
import CoreLocation

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController = UINavigationController()
    
    func homeView() {
        let homeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeView.coordinator = self
        navigationController.pushViewController(homeView, animated: true)
    }
    
    func detailView() {
        let detailView = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailView.coordinator = self
        navigationController.pushViewController(detailView, animated: true)
    }
}
