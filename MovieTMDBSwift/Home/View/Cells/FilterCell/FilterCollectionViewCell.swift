//
//  FilterCollectionViewCell.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/1/22.
//

import UIKit

enum Filters {
    case byAll
    case bySpanish
    case byRelease1993
}

final class FilterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var backgroundStackView: UIStackView! {
        didSet {
            backgroundStackView.setFilterCard()
        }
    }
    @IBOutlet weak var filterLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                filterLabel.textColor = .backgroundColor()
                backgroundStackView.backgroundColor = .labelColor()
            } else {
                filterLabel.textColor = .labelColor()
                backgroundStackView.backgroundColor = .backgroundColor()
            }
        }
    }
    
    static let FILTER_CELL_ID = "FILTER_CELL_ID"
    
    func setUpCell(filter: FilterMovies) {
        filterLabel.text = filter.title
    }
}
