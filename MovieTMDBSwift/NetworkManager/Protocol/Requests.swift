//
//  Request.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/2/22.
//

import Foundation
import RxSwift

protocol MoviesRequest {
    func getMovies<T>() -> Observable<[T]>
}

protocol DetailRequest {
    func getMovie(movie: Movie) -> RxSwift.Observable<Movie>
}
