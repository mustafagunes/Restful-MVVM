//
//  NetworkProvider.swift
//  Restful-MVVM
//
//  Created by Mustafa GUNES on 8.04.2019.
//  Copyright © 2019 Mustafa GUNES. All rights reserved.
//

class NetworkProvider: Network {
    
    static func getPosts(completion: @escaping (APIResult) -> Void) {
        request(.posts, method: .get, completion: completion)
    }
    
    static func getComments(completion: @escaping (APIResult) -> Void) {
        request(.comments, method: .get, completion: completion)
    }
    
    static func getAlbums(completion: @escaping (APIResult) -> Void) {
        request(.albums, method: .get, completion: completion)
    }
    
    static func getPhotos(completion: @escaping (APIResult) -> Void) {
        request(.photos, method: .get, completion: completion)
    }
    
    static func getTodos(completion: @escaping (APIResult) -> Void) {
        request(.todos, method: .get, completion: completion)
    }
    
    static func getUsers(completion: @escaping (APIResult) -> Void) {
        request(.users, method: .get, completion: completion)
    }
}
