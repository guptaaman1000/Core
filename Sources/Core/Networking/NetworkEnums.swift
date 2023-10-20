//
//  NetworkEnums.swift
//  MovieApp
//
//  Created by Aman Gupta on 16/10/23.
//

import Foundation

let apiKey = "34c902e6393dc8d970be5340928602a7"

public enum BaseUrlType: String {
    case defaultUrl = "https://api.themoviedb.org/3"
    case imageUrl = "https://image.tmdb.org/t/p"
}

public enum NetworkError: Error {
    case failedToMapObject
    case invalidURL
    case noContent
    case badResponse(code: Int?, desc: String?)
    case timeout
    case unKnown
}

public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

enum Constants {
    static let responseLanguage = "en-US"
    static let contentNotAvailable = 204
}

