//
//  PostsViewController.swift
//  Restful-MVVM
//
//  Created by Mustafa GUNES on 9.04.2019.
//  Copyright © 2019 Mustafa GUNES. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {

    // MARK : Global Definitions
    let postsViewModel = PostsViewModel()
    
    // MARK : - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsViewModel.requestData()
        postsViewModel.viewModelViewDelegate = self
    }
}

extension PostsViewController: ViewModelDelegate {
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = self.postsViewModel.numberOfRowsInSection()
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
