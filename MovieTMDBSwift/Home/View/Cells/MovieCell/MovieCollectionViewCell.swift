//
//  MovieCollectionViewCell.swift
//  MovieTMDBSwift   nn
//
//  Created by Kevin Morales on 10/1/22.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundStackView: UIStackView! {
        didSet {
            backgroundStackView.setCard()
        }
    }
    @IBOutlet weak var movieImageView: UIImageView!

    static let MOVIE_CELL_ID = "MOVIE_CELL_ID"
    
    func setUpCell(movie: Movie) {
        let urlString = API.imageURL + movie.image
        movieImageView.downloadImageWithAnimation(urlString: urlString)
    }
}
