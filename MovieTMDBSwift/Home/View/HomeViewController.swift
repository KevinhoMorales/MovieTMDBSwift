//
//  HomeViewController.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: MainViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var newReleasesCollectionView: UICollectionView!
    @IBOutlet weak var trendsCollectionView: UICollectionView!
    @IBOutlet weak var filtersCollectionView: UICollectionView!
    @IBOutlet weak var recommendedForYouCollectionView: UICollectionView!
    @IBOutlet weak var recommendedForYouHeightConstraint: NSLayoutConstraint! {
        didSet {
            recommendedForYouHeightConstraint.constant = 600
        }
    }
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint! {
        didSet {
            viewHeightConstraint.constant = 775
        }
    }
    
    
    
    // MARK: - VIEWMODEL
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        navigationItem.setTitle(title: "eMovie", subtitle: "")
        setUpCollectionsView()
    }
    
    private func setUpCollectionsView() {
        setUpNewReleasesCollectionView()
        setUpTrendsCollectionView()
        setUpReccommendedForYouCollectionView()
        setUpFilterMoviesCollectionView()
    }
    
    @IBAction func seeMoreNewReleasesAction(_ sender: Any) {
        coordinator?.seeMoreView(movies: viewModel?.newReleasesAllMovies)
    }
    
    @IBAction func
    seeMoreTrendsAction(_ sender: Any) {
        coordinator?.seeMoreView(movies: viewModel?.trendsAllMovies)
    }
    
    @IBAction func seeMoreRecommendedForYouAction(_ sender: Any) {
        coordinator?.seeMoreView(movies: viewModel?.recommendedForYourAllMovies)
    }
}

extension HomeViewController: HomeViewProtocol {
    private func setUpNewReleasesCollectionView() {
        setUpNewReleasesCell()
        viewModel?.newReleasesMovies?.bind(to: newReleasesCollectionView.rx.items(cellIdentifier: MovieCollectionViewCell.MOVIE_CELL_ID)) { row, model, cell in
            let movieCell = cell as! MovieCollectionViewCell
            movieCell.setUpCell(movie: model)
        }.disposed(by: disposeBag)
        newReleasesCollectionView.rx.modelSelected(Movie.self)
            .subscribe(
                onNext: { [weak self] movie in
                    let id = String(movie.movieID)
                    self?.getDetailMovie(id: id)
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: "OK", viewcontroller: self!)
                }, onCompleted: {
                }).disposed(by: disposeBag)
    }
    
    private func setUpTrendsCollectionView() {
        setUpTrendsCell()
        viewModel?.trendsMovies?.bind(to: trendsCollectionView.rx.items(cellIdentifier: MovieCollectionViewCell.MOVIE_CELL_ID)) { row, model, cell in
            let movieCell = cell as! MovieCollectionViewCell
            movieCell.setUpCell(movie: model)
        }.disposed(by: disposeBag)
        trendsCollectionView.rx.modelSelected(Movie.self)
            .subscribe(
                onNext: { [weak self] movie in
                    let id = String(movie.movieID)
                    self?.getDetailMovie(id: id)
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: "OK", viewcontroller: self!)
                }, onCompleted: {
                }).disposed(by: disposeBag)
    }
    
    private func setUpReccommendedForYouCollectionView() {
        setUpReccommendedForYouCell()
        viewModel?.recommendedForYourMovies?.bind(to: recommendedForYouCollectionView.rx.items(cellIdentifier: MovieCollectionViewCell.MOVIE_CELL_ID)) { row, model, cell in
            let movieCell = cell as! MovieCollectionViewCell
            movieCell.setUpCell(movie: model)
        }.disposed(by: disposeBag)
        recommendedForYouCollectionView.rx.modelSelected(Movie.self)
            .subscribe(
                onNext: { [weak self] movie in
                    let id = String(movie.movieID)
                    self?.getDetailMovie(id: id)
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: "OK", viewcontroller: self!)
                }, onCompleted: {
                }).disposed(by: disposeBag)
    }
    
    private func setUpFilterMoviesCollectionView() {
        setFilterMoviesCell()
        viewModel?.filterMovies?.bind(to: filtersCollectionView.rx.items(cellIdentifier: FilterCollectionViewCell.FILTER_CELL_ID)) { row, model, cell in
            let filtersCell = cell as! FilterCollectionViewCell
            filtersCell.setUpCell(filter: model)
        }.disposed(by: disposeBag)
        filtersCollectionView.rx.modelSelected(FilterMovies.self)
            .subscribe(
                onNext: { [weak self] filter in
                    self?.viewModel?.getTrendsMovies(filter: filter)
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: "OK", viewcontroller: self!)
                }, onCompleted: {
                }).disposed(by: disposeBag)
    }
    
    private func setUpNewReleasesCell() {
        let newReleases = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        newReleasesCollectionView.register(newReleases, forCellWithReuseIdentifier: MovieCollectionViewCell.MOVIE_CELL_ID)
    }
    
    private func setUpTrendsCell() {
        let trends = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        trendsCollectionView.register(trends, forCellWithReuseIdentifier: MovieCollectionViewCell.MOVIE_CELL_ID)
    }
    
    private func setUpReccommendedForYouCell() {
        let recommendedForYou = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        recommendedForYouCollectionView.register(recommendedForYou, forCellWithReuseIdentifier: MovieCollectionViewCell.MOVIE_CELL_ID)
    }
    
    private func setFilterMoviesCell() {
        let filterMovies = UINib(nibName: "FilterCollectionViewCell", bundle: nil)
        filtersCollectionView.register(filterMovies, forCellWithReuseIdentifier: FilterCollectionViewCell.FILTER_CELL_ID)
    }
}

extension HomeViewController {
    private func getDetailMovie(id: String) {
        viewModel?.getDetailMovie(id: id)
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] movies in
                    self?.coordinator?.detailView(movie: movies)
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: "OK", viewcontroller: self!)
                    Loading.hide()
                }, onCompleted: {
                    Loading.hide()
                }).disposed(by: disposeBag)
    }
}
