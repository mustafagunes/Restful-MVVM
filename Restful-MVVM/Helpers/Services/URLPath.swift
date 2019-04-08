//
//  URLPath.swift
//  Restful-MVVM
//
//  Created by Mustafa GUNES on 8.04.2019.
//  Copyright © 2019 Mustafa GUNES. All rights reserved.
//

enum BaseURLPath: String {
    case posts
    case comments
    case albums
    case photos
    case todos
    case users
}

extension BaseURLPath {
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    var path: String {
        switch self {
        case .posts:
            return baseURL + "posts"
        case .comments:
            return baseURL + "comments"
        case .albums:
            return baseURL + "albums"
        case .photos:
            return baseURL + "photos"
        case .todos:
            return baseURL + "todos"
        case .users:
            return baseURL + "users"
        }
    }
}
