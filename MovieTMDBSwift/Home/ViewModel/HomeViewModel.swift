//
//  HomeViewModel.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import Foundation
import RxSwift
import RxRelay

final class HomeViewModel: HomeViewModelProtocol {
    var view: HomeViewController
    var newReleasesMovies: BehaviorRelay<[Movie]>?
    
    init(view: HomeViewController) {
        self.view = view
    }
    
    func viewDidLoad() {
        setUpData()
        setUpView()
    }
    
    private func setUpData() {
        newReleasesMovies = BehaviorRelay(value: [])
    }
    
    private func setUpView() {
        view.navigationItem.setTitle(title: "eMovie", subtitle: "")
        view.setUpNewReleasesCollectionView()
    }
    
    func getNewReleasesMovies<T>() -> Observable<[T]> {
        NewRelesesRequest().getMovies()
    }
    
    func getDetailMovie(movie: Movie) -> Observable<Movie> {
        DetailMovieRequest().getMovie(movie: movie)
    }
}
