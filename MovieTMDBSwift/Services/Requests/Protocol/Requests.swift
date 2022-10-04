//
//  Request.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/2/22.
//

import Foundation
import RxSwift

protocol MoviesRequest {
    func getMovies<T>(filter: FilterMovies) -> Observable<[T]>
}

protocol DetailRequest {
    func getMovie(id: String) -> RxSwift.Observable<Movie>
}
