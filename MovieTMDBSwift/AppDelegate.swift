//
//  AppDelegate.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private let coordinator = MainCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpInitView()
        return true
    }
    
    private func setUpInitView() {
        coordinator.homeView()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator.navigationController
        window?.makeKeyAndVisible()
    }
}

