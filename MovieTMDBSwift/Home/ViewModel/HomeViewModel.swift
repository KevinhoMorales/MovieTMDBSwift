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
    var reccommendedForYou: BehaviorRelay<[Movie]>?
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
        reccommendedForYou = BehaviorRelay(value: [])
        filterMovies = BehaviorRelay(value: [FilterMovies(title: "En español", titleColor: .blackColor(), backgroundColor: .whiteColor()),
                                             FilterMovies(title: "Lanzadas en 1993", titleColor: .whiteColor(), backgroundColor: .blackColor())])
        getMovies()
    }
    
    private func getMovies() {
        getNewReleasesMovies()
        getTrendsMovies()
        getReccommendedForYouMovies()
    }
    
    private func getNewReleasesMovies() {
        DataManager.getNewReleasesMovies()
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] movies in
                    self?.newReleasesMovies?.accept(Array(movies.prefix(upTo: 5)))
                    self?.view.newReleasesCollectionView.reloadData()
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: "OK", viewcontroller: self!.view)
                    Loading.hide()
                }, onCompleted: {
                    Loading.hide()
                }).disposed(by: view.disposeBag)
    }
    
    private func getTrendsMovies() {
        DataManager.getTrendsMovies()
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] movies in
                    self?.trendsMovies?.accept(Array(movies.prefix(upTo: 5)))
                    self?.view.trendsCollectionView.reloadData()
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: "OK", viewcontroller: self!.view)
                    Loading.hide()
                }, onCompleted: {
                    Loading.hide()
                }).disposed(by: view.disposeBag)
    }
    
    private func getReccommendedForYouMovies() {
        DataManager.getReccommendedForYouMovies()
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] movies in
                    self?.reccommendedForYou?.accept(Array(movies.prefix(upTo: 6)))
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
