//
//  String+Extension.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/5/22.
//

import UIKit

extension String {
    func openYouTubeByKey() {
        guard var url = URL(string: "youtube://\(self)") else { return }
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        } else{
            url = URL(string:"https://www.youtube.com/watch?v=\(self)")!
            UIApplication.shared.open(url)
        }
    }
}
