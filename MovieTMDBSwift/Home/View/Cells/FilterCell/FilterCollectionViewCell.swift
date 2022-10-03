//
//  FilterCollectionViewCell.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/1/22.
//

import UIKit

enum Filters {
    case bySpanish
    case byRelease1993
}

final class FilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundStackView: UIStackView! {
        didSet {
            backgroundStackView.setFilterCard()
        }
    }
    @IBOutlet weak var filterLabel: UILabel!
    
    static let FILTER_CELL_ID = "FILTER_CELL_ID"
    
    func setUpCell(filter: FilterMovies) {
        filterLabel.text = filter.title
        filterLabel.textColor = filter.titleColor
        backgroundStackView.backgroundColor = filter.backgroundColor
    }
}
