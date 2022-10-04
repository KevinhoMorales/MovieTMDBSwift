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
    
    func openTrailer() {
        let youTubeURL = Constants.youtubeURL + movie!.videos!.videos.first!.key
        guard let url = URL(string: youTubeURL) else { return }
        view.present(SFSafariViewController(url: url), animated: true)
    }
}
