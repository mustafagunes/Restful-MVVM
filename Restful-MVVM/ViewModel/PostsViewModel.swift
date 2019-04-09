//
//  PostsViewModel.swift
//  Restful-MVVM
//
//  Created by Mustafa GUNES on 9.04.2019.
//  Copyright © 2019 Mustafa GUNES. All rights reserved.
//

import Foundation

class PostsViewModel {
    
    // MARK : - Definitions
    weak var viewModelViewDelegate: ViewModelDelegate?
    var postsModel: [Posts] = [] {
        didSet {
            viewModelViewDelegate?.reloadTableView()
        }
    }
    
    // MARK : - Methods
    public func numberOfRowsInSection() -> Int {
        return self.postsModel.count
    }
    
    public func requestData() {
        NetworkProvider.getPosts { (result) in
            switch result {
            case .success(let json):
                let posts = json.arrayValue.compactMap { return Posts(data: try! $0.rawData()) }
                self.postsModel.append(contentsOf: posts)
                
            case .failure(let failure):
                switch failure {
                case .connectionError:
                    print("PostsViewModel - connectionError")
                case .authorizationError(let errorJson):
                    print("authorizationError - \(errorJson) ")
                default:
                    print("Unknown Error")
                }
            }
        }
    }
}
