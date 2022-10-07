//
//  Errors.swift
//  MovieTMDBSwift
//
//  Created by Kevin Morales on 10/6/22.
//

import Foundation

enum Errors: LocalizedError {
    case notFound
    case serverProblem
    case invalidResponse
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .notFound:
            return "ERROR 404"
        case .serverProblem:
            return "ERROR 500"
        case .invalidResponse:
            return "RESPUESTA INVÁLIDA"
        }
    }    
}
