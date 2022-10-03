//
//  NewRelesesRequest.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/2/22.
//

import Foundation
import RxSwift

struct NewRelesesRequest: MoviesRequest {
    func getMovies<T>(filter: FilterMovies) -> RxSwift.Observable<[T]> {
        Loading.show(Constants.loadingMovies)
        return Observable.create { observer in
            let session = URLSession.shared
            let urlString = API.apiURL + Endpoints.newReleasesURL + API.apiKey
            let url = URL(string: urlString)
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.timeoutInterval = TimeInterval(10)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            session.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
                switch response.statusCode {
                case 200:
                    do {
                        let decoder = JSONDecoder()
                        let movies = try decoder.decode(Movies.self, from: data)
                        observer.onNext(movies.movies as! [T])
                    } catch let error {
                        observer.onError(error)
                    }
                case 404:
                    observer.onError(error!)
                default: break
                }
                observer.onCompleted()
            }.resume()
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
}
