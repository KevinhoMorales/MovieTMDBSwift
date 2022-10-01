//
//  DetailViewController.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit

class DetailViewController: MainViewController {
    
    // MARK: IBOutlets
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setTitle(title: "Her", subtitle: "")
        gradientView.setGradientBackground(colorTops: .white, colorBottoms: .black)
        addBackButton()
    }
    
}
