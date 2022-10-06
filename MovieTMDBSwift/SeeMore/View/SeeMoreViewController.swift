//
//  SeeMoreViewController.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/3/22.
//

import UIKit
import RxSwift

final class SeeMoreViewController: MainViewController {
    @IBOutlet weak var seeMoreTableView: UITableView!
    
    // MARK: - IBOutlets
    var viewModel: SeeMoreViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        addBackButton()
        setUpSeeMoreTableView()
    }
    
    private func setUpSeeMoreTableView() {
        setUpTableViewDelegate()
        setSeeMoreCell()
        viewModel?.movies?.bind(to: seeMoreTableView.rx.items(cellIdentifier: SeeMoreTableViewCell.SEE_MORE_CELL_ID)) { row, model, cell in
            let seeMoreCell = cell as! SeeMoreTableViewCell
            seeMoreCell.setUpCell(movie: model)
        }.disposed(by: disposeBag)
        seeMoreTableView.rx.modelSelected(Movie.self)
            .subscribe(
                onNext: { [weak self] movie in
                    let id = String(movie.movieID)
                    self?.getDetailMovie(id: id)
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: Constants.OK, viewcontroller: self!)
                }, onCompleted: {
                }).disposed(by: disposeBag)
    }
    
    private func setSeeMoreCell() {
        let seeMore = UINib(nibName: "SeeMoreTableViewCell", bundle: nil)
        seeMoreTableView.register(seeMore, forCellReuseIdentifier: SeeMoreTableViewCell.SEE_MORE_CELL_ID)
        seeMoreTableView.tableFooterView = UIView()
    }
    
    private func setUpTableViewDelegate() {
        seeMoreTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
}

extension SeeMoreViewController: SeeMoreViewProtocol {
    
}

extension SeeMoreViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }

}

extension SeeMoreViewController {
    private func getDetailMovie(id: String) {
        viewModel?.getDetailMovie(id: id)
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] movies in
                    self?.coordinator?.detailView(movie: movies)
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: Constants.OK, viewcontroller: self!)
                    Loading.hide()
                }, onCompleted: {
                    Loading.hide()
                }).disposed(by: disposeBag)
    }
}
