//
//  UIImageView+Extension.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/2/22.
//

import UIKit
import Kingfisher

extension UIImageView {
    func downloadImageWithAnimation(urlString: String, placeHolderImage: String = "movie-placeholder") {
        let url = URL(string: urlString)
        let processor = DownsamplingImageProcessor(size: self.bounds.size) |> RoundCornerImageProcessor(cornerRadius: 5)
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: placeHolderImage),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
