//
//  NetworkProtocols.swift
//  Restful-MVVM
//
//  Created by Mustafa GUNES on 8.04.2019.
//  Copyright © 2019 Mustafa GUNES. All rights reserved.
//

import SwiftyJSON

/// Service HTTP Method
///
/// - get: GET Verb
/// - post: POST Verb
/// - head: HEAD Verb
/// - put: PUT Verb
/// - delete: DELETE Verb
enum ServiceHTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case head    = "HEAD"
    case put     = "PUT"
    case delete  = "DELETE"
}

enum APIResult {
    case success(JSON)
    case failure(RequestError)
}

enum RequestError: Error {
    case unknownError
    case connectionError
    case authorizationError(JSON)
    case invalidRequest
    case notFound
    case invalidResponse
    case serverError
    case serverUnavailable
}

protocol NetworkProtocols {
    
    /// Makes a request to server
    ///
    /// - Parameters:
    ///   - url: Request URL
    ///   - method: HTTP Method
    ///   - completion: Closure called at the end of the reqeust
    func request(_ url: String, method: ServiceHTTPMethod, completion: @escaping (APIResult)  -> Void)
    
    /// Makes a request to server
    ///
    /// - Parameters:
    ///   - url: Request URL
    ///   - method: HTTP Method
    ///   - parameters: Request Parameters
    ///   - completion: Closure called at the end of the reqeust
    func request(_ url: String, method: ServiceHTTPMethod, parameters: [String: Any], completion: @escaping (APIResult)  -> Void)
}
