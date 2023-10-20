//
//  RESTNetworkClient.swift
//  MovieApp
//
//  Created by Aman Gupta on 16/10/23.
//

import Foundation
import Combine

public final class RESTNetworkClient: NetworkClientType {
    
    private let requestBuilder = RequestBuilder()
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    public func request<Response: Decodable>(_ request: Request) -> AnyPublisher<Response, NetworkError> {
        
        let urlRequest: URLRequest
        
        do {
            urlRequest = try requestBuilder.buildRequest(request: request)
        } catch let error {
            if error is NetworkError {
                return Fail(error: error as! NetworkError).eraseToAnyPublisher()
            } else {
                return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
            }
        }
        
        return session.dataTaskPublisher(for: urlRequest)
        .tryMap { output in
            if output.response.isSuccess {
                if output.response.httpStatusCode == Constants.contentNotAvailable {
                    throw NetworkError.noContent
                } else {
                    return output.data
                }
            } else {
                throw NetworkError.badResponse(code: output.response.httpStatusCode, desc: output.response.description)
            }
        }
        .decode(type: Response.self, decoder: JSONDecoder())
        .mapError { error in
            if error is NetworkError {
                return error as! NetworkError
            } else {
                return NetworkError.badResponse(code: (error as NSError).code, desc: error.localizedDescription)
            }
        }
        .eraseToAnyPublisher()
    }
}
