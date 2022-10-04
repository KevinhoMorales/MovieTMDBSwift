//
//  SeeMoreViewModel.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/3/22.
//

import Foundation
import RxRelay

final class SeeMoreViewModel: SeeMoreViewModelProtocol {
    var view: SeeMoreViewController
    var movies: BehaviorRelay<[Movie]>?
    
    init(view: SeeMoreViewController) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
}
