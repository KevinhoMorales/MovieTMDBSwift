//
//  MovieCollectionViewCell.swift
//  MovieTMDBSwift   nn
//
//  Created by Kevin Morales on 10/1/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImageView: UIImageView!

    static let MOVIE_CELL_ID = "MOVIE_CELL_ID"
    
    func setUpNewReleasesCell(movie: Movie) {
        let urlString = Constants.URL.urlImagesMovies + movie.image
        movieImageView.downloadImageWithAnimation(urlString: urlString)
    }
}
