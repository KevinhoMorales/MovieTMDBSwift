//
//  DetailViewModel.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import Foundation

final class DetailViewModel: DetailViewModelProtocol {
    var view: DetailViewController
    var movie: Movie?
    
    init(view: DetailViewController) {
        self.view = view
    }
    
    func viewDidLoad() {
        setUpData()
        setUpView()
    }
    
    private func setUpData() {
        let urlString = Constants.URL.urlImagesMovies + movie!.image
        view.movieImageView.downloadImageWithAnimation(urlString: urlString)
        view.movieNameLabel.text = movie?.title
        view.voteAverageLabel.text = "\(movie!.voteAverage)"
    }
    
    private func setUpView() {
        view.gradientView.setGradientBackground(colorTops: .white, colorBottoms: .black)
        view.addBackButton()
    }
}
