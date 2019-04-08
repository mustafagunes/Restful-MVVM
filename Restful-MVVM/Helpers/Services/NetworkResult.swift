//
//  NetworkResult.swift
//  Restful-MVVM
//
//  Created by Mustafa GUNES on 8.04.2019.
//  Copyright © 2019 Mustafa GUNES. All rights reserved.
//

import SwiftyJSON

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
