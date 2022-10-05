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
        gradientView.setGradientBackground(colorTops: .backgroundColor(), colorBottoms: .backgroundColor())
        addBackButton()
    }
    
    private func setUpData() {
        let urlString = API.imageURL + viewModel!.getMovie().image
        movieImageView.downloadImageWithAnimation(urlString: urlString)
        movieNameLabel.text = viewModel!.getMovie().title
        voteAverageLabel.text = viewModel!.getMovie().voteAverage.roundValue()
        languageLabel.text = viewModel!.getMovie().originalLanguage
        releaseDateYearLabel.text = viewModel!.getYearByReleaseDate()
        categoriesLabel.text = viewModel!.getGenres()
        sinopsisLabel.text = viewModel!.getMovie().sinopsis
    }
    @IBAction func seeTrailerAction(_ sender: Any) {
        seeTrailerAction()
    }
}

extension DetailViewController: DetailViewProtocol {
    func seeTrailerAction() {
        viewModel?.openTrailerOnYouTube()
    }
}
