//
//  NetworkClientType.swift
//  MovieApp
//
//  Created by Aman Gupta on 16/10/23.
//

import Foundation
import Combine

//sourcery: AutoMockable
public protocol NetworkClientType {
    func request<Response: Decodable>(_ request: Request) -> AnyPublisher<Response, NetworkError>
}
