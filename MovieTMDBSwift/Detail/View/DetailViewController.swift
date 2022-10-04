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
    @IBOutlet weak var releaseDateYearLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var sinopsisLabel: UILabel!
    // MARK: - VIEWMODEL
    var viewModel: DetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        setUpView()
    }

    private func setUpView() {
        setUpData()
        gradientView.setGradientBackground(colorTops: .white, colorBottoms: .black)
        addBackButton()
    }
    
    private func setUpData() {
        let urlString = API.imageURL + viewModel!.movie!.image
        movieImageView.downloadImageWithAnimation(urlString: urlString)
        movieNameLabel.text = viewModel!.movie!.title
        voteAverageLabel.text = viewModel!.movie!.voteAverage.roundValue()
        languageLabel.text = viewModel!.movie!.originalLanguage
        releaseDateYearLabel.text = viewModel!.getYearByReleaseDate()
        categoriesLabel.text = viewModel!.getGenres()
        sinopsisLabel.text = viewModel!.movie!.sinopsis
    }
    @IBAction func seeTrailerAction(_ sender: Any) {
        viewModel?.openTrailer()
    }
}

extension DetailViewController: DetailViewProtocol {
    
}
