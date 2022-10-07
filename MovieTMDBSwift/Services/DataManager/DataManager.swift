//
//  DataManager.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/2/22.
//

import Foundation
import RxSwift

struct DataManager {
    static func getMovies(endpoint: String, filter: FilterMovies?) -> Observable<[Movie]> {
        MoviesRequest().getMovies(endpoint: endpoint, filter: filter)
    }
    static func getMovieById(id: String) -> Observable<Movie> {
        DetailMovieRequest().getMovie(id: id)
    }
}
