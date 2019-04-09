//
//  Posts.swift
//  Restful-MVVM
//
//  Created by Mustafa GUNES on 9.04.2019.
//  Copyright © 2019 Mustafa GUNES. All rights reserved.
//

import Foundation

struct Posts: Codable {
    let userId, id : Int
    let title, body : String
    
    enum CodingKeys: String, CodingKey {
        case userId, id, title, body
    }
}

extension Posts {
    init?(data: Data) {
        guard let data = try? JSONDecoder().decode(Posts.self, from: data) else { return nil }
        self = data
    }
}
