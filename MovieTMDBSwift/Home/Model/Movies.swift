//
//  NewReleases.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/1/22.
//

import Foundation

import Foundation

struct Movies: Codable {
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Codable {
    let title: String
    let popularity: Double
    let movieID: Int
    let originalTitle: String
    let originalLanguage: String
    let voteAverage: Double
    let sinopsis: String
    let releaseDate: String
    let image: String
    let videos: Videos?
    
    enum CodingKeys: String, CodingKey {
        case title, popularity
        case movieID = "id"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case voteAverage = "vote_average"
        case sinopsis = "overview"
        case releaseDate = "release_date"
        case image = "poster_path"
        case videos
    }
}

struct Videos: Codable {
    let videos: [Video]
    
    enum CodingKeys: String, CodingKey {
        case videos = "results"
    }
}

struct Video: Codable {
    let key: String
    
    enum CodingKeys: String, CodingKey {
        case key
    }
}
