//
//  SeeMoreTableViewCell.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/3/22.
//

import UIKit

class SeeMoreTableViewCell: UITableViewCell {
    @IBOutlet weak var backgroundStackView: UIView! {
        didSet {
            backgroundStackView.setCard()
        }
    }
    @IBOutlet weak var movieImageView: UIImageView! 
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sinopsisLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    static let SEE_MORE_CELL_ID = "SEE_MORE_CELL_ID"
    
    func setUpCell(movie: Movie) {
        titleLabel.text = movie.title
        sinopsisLabel.text = movie.sinopsis
        releaseDateLabel.text = "Lanzada en \(movie.releaseDate)"
        let urlString = API.imageURL + movie.image
        movieImageView.downloadImageWithAnimation(urlString: urlString)
    }
}
