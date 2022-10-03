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
    var trendsMovies: BehaviorRelay<[Movie]>?
    var recommendedForYourMovies: BehaviorRelay<[Movie]>?
    var filterMovies: BehaviorRelay<[FilterMovies]>?
    
    init(view: HomeViewController) {
        self.view = view
    }
    
    func viewDidLoad() {
        setUpData()
    }
    
    private func setUpData() {
        newReleasesMovies = BehaviorRelay(value: [])
        trendsMovies = BehaviorRelay(value: [])
        recommendedForYourMovies = BehaviorRelay(value: [])
        filterMovies = BehaviorRelay(value: [FilterMovies(title: Constants.filterOptions[0], titleColor: .blackColor(), backgroundColor: .whiteColor()),
                                             FilterMovies(title: Constants.filterOptions[1], titleColor: .whiteColor(), backgroundColor: .blackColor())])
        getMovies()
    }
    
    private func getMovies() {
        guard let filter = filterMovies?.value.first else { return }
        getNewReleasesMovies(filter: filter)
        getTrendsMovies(filter: filter)
    }
    
    private func getNewReleasesMovies(filter: FilterMovies) {
        DataManager.getNewReleasesMovies(filter: filter)
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] movies in
                    self?.newReleasesMovies?.accept(Array(movies.prefix(upTo: 6)))
                    self?.view.newReleasesCollectionView.reloadData()
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: "OK", viewcontroller: self!.view)
                    Loading.hide()
                }, onCompleted: {
                    Loading.hide()
                }).disposed(by: view.disposeBag)
    }
    
    func getTrendsMovies(filter: FilterMovies) {
        DataManager.getTrendsMovies(filter: filter)
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] movies in
                    let spanishMovies = movies.filter { $0.originalLanguage == "es"}
                    let moviesForYou = spanishMovies
                    let moviesTrends = Array(movies.prefix(upTo: 6))
                    self?.trendsMovies?.accept(moviesTrends)
                    self?.recommendedForYourMovies?.accept(moviesForYou)
                    self?.view.trendsCollectionView.reloadData()
                    self?.view.recommendedForYouCollectionView.reloadData()
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: "OK", viewcontroller: self!.view)
                    Loading.hide()
                }, onCompleted: {
                    Loading.hide()
                }).disposed(by: view.disposeBag)
    }
    
    func getDetailMovie(movie: Movie) -> Observable<Movie> {
        DetailMovieRequest().getMovie(movie: movie)
    }
}
