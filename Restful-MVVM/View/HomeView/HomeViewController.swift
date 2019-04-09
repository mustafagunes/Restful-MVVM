//
//  HomeViewController.swift
//  Restful-MVVM
//
//  Created by Mustafa GUNES on 9.04.2019.
//  Copyright © 2019 Mustafa GUNES. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK : - Definitions
    let cellImageArray: [UIImage] = [#imageLiteral(resourceName: "posts"), #imageLiteral(resourceName: "comments"), #imageLiteral(resourceName: "albums"), #imageLiteral(resourceName: "photos"), #imageLiteral(resourceName: "todos"), #imageLiteral(resourceName: "users")]
    let cellTitleArray: [String] = ["Gönderiler", "Yorumlar", "Albümler", "Fotoğraflar", "Yapılacaklar", "Kullanıcılar"]
    
    // MARK : Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
    }
    
    // MARK : - CollectionViewCell Dynamic Size
    func calculateDynamicCell() -> (width: CGFloat, height: CGFloat) {
        let viewHeight = self.view.frame.height
        let navigationBarHeight = self.navigationController?.navigationBar.frame.height
        let remainingViewHeight = viewHeight - navigationBarHeight!
        let remainingViewColumnHeight = remainingViewHeight / 3.05
        
        let viewWidth = self.view.frame.width
        let viewColumnWidth = viewWidth / 2.1
        let resultWidth = viewColumnWidth - 8.0 // 2.0
        let resultHeight = remainingViewColumnHeight - 15.0 // 8.0
        
        return (width: resultWidth, height: resultHeight)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellTitleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: ...
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? HomeCollectionViewCell
        
        // MARK : - Cell Layer Setup
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.6
        cell?.layer.cornerRadius = 10
        cell?.clipsToBounds = true
        cell?.layer.masksToBounds = false
        cell?.layer.shadowColor = UIColor.lightGray.cgColor
        cell?.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell?.layer.shadowRadius = 5
        cell?.layer.shadowOpacity = 0.2
        
        cell?.titleLabel.text = cellTitleArray[indexPath.row]
        cell?.imageView.image = cellImageArray[indexPath.row]
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenHeight: CGFloat = UIScreen.main.bounds.size.height
        let screenWidth: CGFloat = UIScreen.main.bounds.size.width
        
        // iPhone X Series
        if screenWidth >= 375 && screenHeight >= 812 {
            return CGSize(width: calculateDynamicCell().width, height: calculateDynamicCell().height - 12.0)
        }
        else {
            return CGSize(width: calculateDynamicCell().width, height: calculateDynamicCell().height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
}
