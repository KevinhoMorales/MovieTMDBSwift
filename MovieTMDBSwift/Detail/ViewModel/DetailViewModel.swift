//
//  DetailViewModel.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 9/30/22.
//

import Foundation
import SafariServices

final class DetailViewModel: DetailViewModelProtocol {
    var view: DetailViewController
    var movie: Movie?
    
    init(view: DetailViewController) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
    
    func openTrailerOnYouTube() {
        let youtubeKey = getMovie().videos!.videos.first!.key
        youtubeKey.openYouTubeByKey()
    }
    
    func getYearByReleaseDate() -> String {
        let year = getMovie().releaseDate.split(separator: "-")[0]
        return "\(year)"
    }
    
    func getGenres() -> String {
        guard let genres = getMovie().genres else { return "No dispone de categorías todavía" }
        let genresString = genres.compactMap { $0.name }.joined(separator: " • ")
        return genresString
    }
    
    func getMovie() -> Movie! {
        guard let movie = movie else { return nil }
        return movie
    }
}
