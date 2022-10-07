//
//  DetailMovieRequest.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/2/22.
//

import Foundation
import RxSwift

struct DetailMovieRequest: DetailRequestProtocol {
    func getMovie(id: String) -> RxSwift.Observable<Movie> {
        Loading.show(Constants.loadingMovieDetail)
        return Observable.create { observer in
            let session = URLSession.shared
            let urlString = API.apiURL + Endpoints.movieDetailURL + id + API.apiKey + API.appendVideoToResponse
            let url = URL(string: urlString)
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.timeoutInterval = TimeInterval(10)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            session.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
                    observer.onError(Errors.invalidResponse)
                    return
                }
                switch response.statusCode {
                case 200:
                    do {
                        let decoder = JSONDecoder()
                        let movie = try decoder.decode(Movie.self, from: data)
                        observer.onNext(movie)
                    } catch let error {
                        observer.onError(Errors.failedRequest(description: error.localizedDescription))
                    }
                case 404:
                    observer.onError(Errors.notFound)
                case 500:
                    observer.onError(Errors.serverProblem)
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
