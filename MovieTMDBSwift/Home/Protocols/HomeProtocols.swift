//
//  HomeProtocols.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/1/22.
//

import Foundation
import RxSwift
import RxRelay

protocol HomeViewModelProtocol {
    var view: HomeViewController { get set }
    var newReleasesMovies: BehaviorRelay<[Movie]>? { get set }
    var trendsMovies: BehaviorRelay<[Movie]>? { get set }
    var recommendedForYourMovies: BehaviorRelay<[Movie]>? { get set }
    var newReleasesAllMovies: BehaviorRelay<[Movie]>? { get set }
    var trendsAllMovies: BehaviorRelay<[Movie]>? { get set }
    var recommendedForYourAllMovies: BehaviorRelay<[Movie]>? { get set }
    var filterMovies: BehaviorRelay<[FilterMovies]>? { get set }
    func viewDidLoad()
    func getTrendsMovies(filter: FilterMovies)
    func getDetailMovie(id: String) -> Observable<Movie>
}

protocol HomeViewProtocol {
    var viewModel: HomeViewModelProtocol? { get set }
}
