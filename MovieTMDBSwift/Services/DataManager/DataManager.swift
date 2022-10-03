//
//  DataManager.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/2/22.
//

import Foundation
import RxSwift

struct DataManager {
    static func getNewReleasesMovies() -> Observable<[Movie]> {
        NewRelesesRequest().getMovies()
    }
}
