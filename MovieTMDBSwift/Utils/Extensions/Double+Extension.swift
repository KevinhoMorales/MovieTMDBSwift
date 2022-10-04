//
//  Double+Extension.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/3/22.
//

import Foundation

extension Double {
    func roundValue() -> String {
        String(format: "%.1f", self)
    }
}
