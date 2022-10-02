//
//  DetailProtocols.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/1/22.
//

import Foundation

protocol DetailViewModelProtocol {
    var view: DetailViewController { get set }
    var movie: Movie? { get set }
    func viewDidLoad()
}

protocol DetailViewProtocol {
    var viewModel: DetailViewModelProtocol? { get set }
}
