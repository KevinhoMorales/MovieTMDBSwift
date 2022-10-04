//
//  SeeMoreViewModel.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/3/22.
//

import Foundation
import RxSwift
import RxRelay

final class SeeMoreViewModel: SeeMoreViewModelProtocol {
    var view: SeeMoreViewController
    var movies: BehaviorRelay<[Movie]>?
    
    init(view: SeeMoreViewController) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
    
    func getDetailMovie(id: String) -> Observable<Movie> {
        DetailMovieRequest().getMovie(id: id)
    }
}
