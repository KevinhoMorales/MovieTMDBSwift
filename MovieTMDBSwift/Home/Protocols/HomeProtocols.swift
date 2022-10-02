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
    func viewDidLoad()
    func getNewReleasesMovies<T>() -> Observable<[T]>
    func getDetailMovie(movie: Movie) -> Observable<Movie>
}

protocol HomeViewProtocol {
    var viewModel: HomeViewModelProtocol? { get set }
}
