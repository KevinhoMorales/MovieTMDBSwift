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
        navigationController?.navigationBar.update(backroundColor: .black, titleColor: .white)
    }
    
    private func checkNetworkIsAvailable() {
        if !Reachability.shared.isConnectedToNetwork() {
            Alerts.warning(title: "Sin internet, por favor revisa tu conexión", buttonTitle: "OK", viewcontroller: self)
        }
    }
    
    func addBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back-icon"), style: .done, target: self, action: #selector(backAction))
    }
    
    @objc
    private func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
}
