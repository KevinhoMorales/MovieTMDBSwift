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
        let homeView = HomeViewController(nibName: "HomeViewController", bundle: Bundle.main)
        let homeViewModel = HomeViewModel(view: homeView)
        homeView.viewModel = homeViewModel
        homeView.coordinator = self
        navigationController.pushViewController(homeView, animated: true)
    }
    
    func detailView(movie: Movie) {
        let detailView = DetailViewController(nibName: "DetailViewController", bundle: Bundle.main)
        let detailViewModel = DetailViewModel(view: detailView)
        detailView.viewModel = detailViewModel
        detailView.viewModel?.movie = movie
        detailView.coordinator = self
        navigationController.pushViewController(detailView, animated: true)
    }
}
