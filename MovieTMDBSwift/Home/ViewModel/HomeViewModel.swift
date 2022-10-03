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
        getNewReleasesMovies()
    }
    
    private func setUpData() {
        newReleasesMovies = BehaviorRelay(value: [])
    }
    
    private func setUpView() {
        view.navigationItem.setTitle(title: "eMovie", subtitle: "")
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
    
    func getDetailMovie(movie: Movie) -> Observable<Movie> {
        DetailMovieRequest().getMovie(movie: movie)
    }
}
