//
//  DataManager.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/2/22.
//

import Foundation
import RxSwift

struct DataManager {
    static func getNewReleasesMovies(filter: FilterMovies) -> Observable<[Movie]> {
        NewRelesesRequest().getMovies(filter: filter)
    }
    static func getTrendsMovies(filter: FilterMovies) -> Observable<[Movie]> {
        TrendsRequest().getMovies(filter: filter)
    }
}
