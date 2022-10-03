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
    @IBOutlet weak var reccommendedForYouCollectionView: UICollectionView!
    
    // MARK: - VIEWMODEL
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        setUpNewReleasesCollectionView()
    }
    
}

extension HomeViewController: HomeViewProtocol {
    func setUpNewReleasesCollectionView() {
        setUpNewReleasesCell()
        viewModel?.newReleasesMovies?.bind(to: newReleasesCollectionView.rx.items(cellIdentifier: MovieCollectionViewCell.MOVIE_CELL_ID)) { row, model, cell in
            let movieCell = cell as! MovieCollectionViewCell
            movieCell.setUpNewReleasesCell(movie: model)
        }.disposed(by: disposeBag)
        newReleasesCollectionView.rx.modelSelected(Movie.self)
            .subscribe(
                onNext: { [weak self] movie in
                    self?.getDetailMovie(movie: movie)
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: "OK", viewcontroller: self!)
                }, onCompleted: {
                }).disposed(by: disposeBag)
    }
    
    private func getDetailMovie(movie: Movie) {
        viewModel?.getDetailMovie(movie: movie)
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] movies in
                    self?.coordinator?.detailView(movie: movie)
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: "OK", viewcontroller: self!)
                    Loading.hide()
                }, onCompleted: {
                    Loading.hide()
                }).disposed(by: disposeBag)
    }
    
    private func setUpNewReleasesCell() {
        let collectionView = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        newReleasesCollectionView.register(collectionView, forCellWithReuseIdentifier: MovieCollectionViewCell.MOVIE_CELL_ID)
    }
}

