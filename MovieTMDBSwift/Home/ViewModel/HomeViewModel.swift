//
//  HomeViewModel.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import Foundation
import RxSwift
import RxRelay
import UIKit

final class HomeViewModel: HomeViewModelProtocol {
    var view: HomeViewController
    var newReleasesMovies: BehaviorRelay<[Movie]>?
    var trendsMovies: BehaviorRelay<[Movie]>?
    var recommendedForYourMovies: BehaviorRelay<[Movie]>?
    var filterMovies: BehaviorRelay<[FilterMovies]>?
    var newReleasesAllMovies: BehaviorRelay<[Movie]>?
    var trendsAllMovies: BehaviorRelay<[Movie]>?
    var recommendedForYourAllMovies: BehaviorRelay<[Movie]>?
    
    init(view: HomeViewController) {
        self.view = view
    }
    
    func viewDidLoad() {
        setUpData()
    }
    
    private func setUpData() {
        initEmptyData()
        filterMovies = BehaviorRelay(value: [FilterMovies(title: Constants.filterOptions[0], filterBy: .byAll),
                                             FilterMovies(title: Constants.filterOptions[1], filterBy: .bySpanish),
                                             FilterMovies(title: Constants.filterOptions[2], filterBy: .byRelease1993)])
        getMovies()
    }
    
    func viewDidAppear(_ animated: Bool) {
        let indexPath = IndexPath(row: 0, section: 0)
        view.filtersCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
    }
    
    private func initEmptyData() {
        newReleasesMovies = BehaviorRelay(value: [])
        trendsMovies = BehaviorRelay(value: [])
        recommendedForYourMovies = BehaviorRelay(value: [])
        newReleasesAllMovies = BehaviorRelay(value: [])
        trendsAllMovies = BehaviorRelay(value: [])
        recommendedForYourAllMovies = BehaviorRelay(value: [])
    }
    
    private func getMovies() {
        guard let filter = filterMovies?.value.first else { return }
        getNewReleasesMovies(endpoint: Endpoints.newReleasesURL, filter: filter)
        getTrendsMovies(endpoint: Endpoints.trendsURL, filter: filter)
    }
    
    private func getNewReleasesMovies(endpoint: String, filter: FilterMovies) {
        DataManager.getMovies(endpoint: endpoint, filter: filter)
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] movies in
                    self?.newReleasesMovies?.accept(Array(movies.prefix(upTo: 6)))
                    self?.newReleasesAllMovies?.accept(movies)
                    self?.view.newReleasesCollectionView.reloadData()
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: Constants.OK, viewcontroller: self!.view)
                    Loading.hide()
                }, onCompleted: {
                    Loading.hide()
                }).disposed(by: view.disposeBag)
    }
    
    func getTrendsMovies(endpoint: String, filter: FilterMovies) {
        DataManager.getMovies(endpoint: endpoint, filter: filter)
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] movies in
                    self?.setRecommendedForYouMovies(movies: movies, filter: filter)
                    self?.setTrendsMovies(movies: movies)
                    self?.trendsAllMovies?.accept(movies)
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: Constants.OK, viewcontroller: self!.view)
                    Loading.hide()
                }, onCompleted: {
                    Loading.hide()
                }).disposed(by: view.disposeBag)
    }
    
    func getDetailMovie(id: String) -> Observable<Movie> {
        DetailMovieRequest().getMovie(id: id)
    }
    
    private func setRecommendedForYouMovies(movies: [Movie], filter: FilterMovies) {
        switch filter.filterBy {
        case .byAll:
            let allMovies = Array(movies.prefix(upTo: 6))
            recommendedForYourMovies?.accept(allMovies)
            recommendedForYourAllMovies?.accept(movies)
        case .bySpanish:
            let moviesBySpanish = movies.filter { $0.originalLanguage == Constants.SPANISH_FILTER }
            recommendedForYourMovies?.accept(moviesBySpanish)
            recommendedForYourAllMovies?.accept(moviesBySpanish)
        case .byRelease1993:
            let moviesBy1993 = movies.filter { $0.releaseDate.contains(Constants.YEAR_1993_FILTER) }
            recommendedForYourMovies?.accept(moviesBy1993)
            recommendedForYourAllMovies?.accept(moviesBy1993)
        }
        setAnimationScroll()
        view.recommendedForYouCollectionView.reloadData()
    }
    
    private func setTrendsMovies(movies: [Movie]) {
        let moviesTrends = Array(movies.prefix(upTo: 6))
        trendsMovies?.accept(moviesTrends)
        view.trendsCollectionView.reloadData()
    }
    
    private func setAnimationScroll() {
        UIView.animate(withDuration: 1) { [weak self] in
            self?.setUpConstraintByMovies(movies: self!.recommendedForYourMovies!.value)
            self?.view.view.layoutIfNeeded()
        }
    }
    
    private func setUpConstraintByMovies(movies: [Movie]) {
        let moviesCount = movies.count
        switch moviesCount {
        case 1,2:
            view.recommendedForYouHeightConstraint.constant = 600
            view.viewHeightConstraint.constant = 775
        case 3,4:
            view.recommendedForYouHeightConstraint.constant = 615
            view.viewHeightConstraint.constant = 1000
        default:
            view.recommendedForYouHeightConstraint.constant = 650
            view.viewHeightConstraint.constant = 1200
        }
    }
}
