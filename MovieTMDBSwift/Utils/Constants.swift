//
//  Constants.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import Foundation

struct Constants {
    static let loadingMovies = "LOADING MOVIES"
    static let loadingMovieDetail = "LOADING DETAIL"
    static let filterOptions = ["Todas", "En español", "Lanzadas en 1993"]
    static let SPANISH_FILTER = "es"
    static let YEAR_1993_FILTER = "1993"
    static let youtubeURL = "https://www.youtube.com/watch?v="
    static let NOT_INTERNET = "Sin internet, por favor revisa tu conexión"
    static let OK = "OK"
    struct Images {
        static let BACK_ICON = "back-icon"
    }
}

struct API {
    static let apiURL = "https://api.themoviedb.org/"
    static let imageURL = "https://image.tmdb.org/t/p/w200"
    static let apiKey = "?api_key=91380f96fa2addf2dfb94d48397cf8da"
    static let appendVideoToResponse = "&append_to_response=videos"
}

struct Endpoints {
    static let newReleasesURL = "3/movie/upcoming"
    static let trendsURL = "3/movie/top_rated"
    static let movieDetailURL = "3/movie/"
}

