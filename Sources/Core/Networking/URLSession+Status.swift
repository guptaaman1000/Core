//
//  URLSession+Status.swift
//  MovieApp
//
//  Created by Aman Gupta on 16/10/23.
//

import Foundation

extension URLResponse {
    
    var isSuccess: Bool {
        return httpStatusCode >= 200 && httpStatusCode < 300
    }
    
    var httpStatusCode: Int {
        guard let statusCode = (self as? HTTPURLResponse)?.statusCode else {
            return 0
        }
        return statusCode
    }
}
