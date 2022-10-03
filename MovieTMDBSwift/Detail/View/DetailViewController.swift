//
//  DetailViewController.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit

class DetailViewController: MainViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var rateView: UIView! {
        didSet {
            rateView.setCard()
        }
    }
    @IBOutlet weak var languageView: UIView!{
        didSet {
            languageView.setCard()
        }
    }
    @IBOutlet weak var yearView: UIView!{
        didSet {
            yearView.setCard()
        }
    }
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    // MARK: - VIEWMODEL
    var viewModel: DetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }
    
}

extension DetailViewController: DetailViewProtocol {
    
}
