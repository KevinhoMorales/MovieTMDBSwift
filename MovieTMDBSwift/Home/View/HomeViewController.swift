//
//  HomeViewController.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit

class HomeViewController: MainViewController {

    // MARK: IBOutlets
    @IBOutlet weak var newReleasesCollectionView: UICollectionView!
    @IBOutlet weak var trendsCollectionView: UICollectionView!
    @IBOutlet weak var filtersCollectionView: UICollectionView!
    @IBOutlet weak var reccommendedForYouCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setTitle(title: "eMovie", subtitle: "")
    }
    
}
