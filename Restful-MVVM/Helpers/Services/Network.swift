//
//  Network.swift
//  Restful-MVVM
//
//  Created by Mustafa GUNES on 8.04.2019.
//  Copyright © 2019 Mustafa GUNES. All rights reserved.
//

import SwiftyJSON

class Network: NetworkProtocols {
    
    // MARK : - Does not take parameters.
    static func request(_ url: BaseURLPath, method: ServiceHTTPMethod, completion: @escaping (APIResult) -> Void) {
        self.fetchData(url, method: method, parameters: nil, completion: completion)
    }
    
    // MARK : - It takes the parameter.
    static func request(_ url: BaseURLPath, method: ServiceHTTPMethod, parameters: [String : Any], completion: @escaping (APIResult) -> Void) {
        self.fetchData(url, method: method, parameters: parameters, completion: completion)
    }
    
    // MARK : - FetchData Method
    static func fetchData(_ Url: BaseURLPath, method: ServiceHTTPMethod, parameters: [String : Any]?, completion: @escaping (APIResult) -> Void) {
        
        var urlRequest = URLRequest(url: URL(string: Url.path)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        urlRequest.httpMethod = method.rawValue
        
        if let parameters = parameters {
            let parametersData = parameters.reduce("") { (result, param) -> String in
                return result + "&\(param.key)=\(param.value as! String)"
                }.data(using: .utf8)
            urlRequest.httpBody = parametersData
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(error)
                completion(APIResult.failure(.connectionError))
            }
            else if let data = data ,let responseCode = response as? HTTPURLResponse {
                do {
                    let responseJson = try JSON(data: data)
                    print("responseCode : \(responseCode.statusCode) \n")
                    switch responseCode.statusCode {
                    case 200:
                        completion(APIResult.success(responseJson))
                    case 400...499:
                        completion(APIResult.failure(.authorizationError(responseJson)))
                    case 500...599:
                        completion(APIResult.failure(.serverError))
                    default:
                        completion(APIResult.failure(.unknownError))
                        break
                    }
                }
                catch let parseJSONError {
                    completion(APIResult.failure(.unknownError))
                    print("error on parsing request to JSON : \(parseJSONError)")
                }
            }
        }.resume()
    }
}
