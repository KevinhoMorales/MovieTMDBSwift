//
//  MainViewController.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {
    
    var coordinator: MainCoordinator?
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initConfig()
    }
    
    private func initConfig() {
        checkNetworkIsAvailable()
        configureNavigationController()
    }
    
    private func configureNavigationController() {
        navigationController?.navigationBar.update(backroundColor: .backgroundColor(), titleColor: .labelColor())
        navigationController?.navigationBar.tintColor = .labelColor()
    }
    
    private func checkNetworkIsAvailable() {
        if !Reachability.shared.isConnectedToNetwork() {
            Alerts.warning(title: Constants.NOT_INTERNET, buttonTitle: Constants.OK, viewcontroller: self)
        }
    }
    
    func addBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: Constants.Images.BACK_ICON), style: .done, target: self, action: #selector(backAction))
    }
    
    @objc
    private func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
}
