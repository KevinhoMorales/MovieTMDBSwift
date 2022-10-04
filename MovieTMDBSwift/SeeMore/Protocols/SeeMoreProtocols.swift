//
//  SeeMoreProtocols.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/3/22.
//

import Foundation
import RxSwift
import RxRelay

protocol SeeMoreViewModelProtocol {
    var view: SeeMoreViewController { get set }
    var movies: BehaviorRelay<[Movie]>? { get set }
    func viewDidLoad()
    func getDetailMovie(id: String) -> Observable<Movie>
}

protocol SeeMoreViewProtocol {
    var viewModel: SeeMoreViewModelProtocol? { get set }
}
