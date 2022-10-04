//
//  SeeMoreViewController.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/3/22.
//

import UIKit

final class SeeMoreViewController: MainViewController {
    @IBOutlet weak var seeMoreTableView: UITableView!
    
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
                    self?.coordinator?.detailView(movie: movie)
                }, onError: { [weak self] error in
                    Alerts.warning(title: error.localizedDescription, buttonTitle: "OK", viewcontroller: self!)
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
