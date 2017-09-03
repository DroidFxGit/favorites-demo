//
//  FavoritesViewAdapter.swift
//  favorites-demo
//
//  Created by Carlos Vázquez Gómez on 9/2/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit

class FavoritesViewAdapter: NSObject {
    
    fileprivate enum itemSection {
        case firstSection
        case secondSection
    }
    
    fileprivate var sections: [FavoriteSection]?
    fileprivate weak var collectionView: UICollectionView?
    
    init(collectionView:UICollectionView, sections: [FavoriteSection]) {
        self.collectionView = collectionView
        self.sections = sections
        super.init()
        configureAdapter()
        configureItemsLayout()
    }
    
}

extension FavoritesViewAdapter {
    
    fileprivate func configureAdapter() {
        collectionView?.dataSource = self
    }
    
    fileprivate func configureItemsLayout() {
    }
}

extension FavoritesViewAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (sections?.count)!
    }
}
