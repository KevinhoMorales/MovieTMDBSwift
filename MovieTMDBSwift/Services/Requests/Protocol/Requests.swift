//
//  Request.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/2/22.
//

import Foundation
import RxSwift

protocol MoviesRequestProtocol {
    func getMovies(endpoint: String, filter: FilterMovies?) -> Observable<[Movie]>
}

protocol DetailRequestProtocol {
    func getMovie(id: String) -> RxSwift.Observable<Movie>
}
