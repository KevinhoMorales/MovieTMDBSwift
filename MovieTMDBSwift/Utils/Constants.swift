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
    
    struct URL {
        static let main = "https://api.themoviedb.org/"
        static let urlImagesMovies = "https://image.tmdb.org/t/p/w200"
    }
    
    struct Endpoints {
        static let urlListPopularMovies = "3/movie/upcoming"
        static let urlDetailMovies = "3/movie/"
    }
}

struct API {
    static let apiURL = "https://api.themoviedb.org/"
    static let imageURL = "https://image.tmdb.org/t/p/w200"
    static let apiKey = "?api_key=91380f96fa2addf2dfb94d48397cf8da"
}

struct Endpoints {
    static let newReleasesURL = "3/movie/upcoming"
    static let trendsURL = "3/movie/popular"
    static let movieDetailURL = "3/movie/"
}

