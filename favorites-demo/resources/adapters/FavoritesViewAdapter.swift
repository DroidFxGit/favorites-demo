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
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.register(UINib(nibName: "CollectionItemViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionIdentifier")
        collectionView?.register(UINib(nibName: "FavoriteItemViewCell", bundle: nil), forCellWithReuseIdentifier: "favoriteIdentifier")
    }
    
    fileprivate func configureItemsLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = 174
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width - 20, height: 174)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView!.collectionViewLayout = layout
    }
}

extension FavoritesViewAdapter: UICollectionViewDelegate {
}

extension FavoritesViewAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let products = sections?[section].products.values
        return (products?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        let item: FavoriteSection = sections![section]
        let product = item.product(at: indexPath.row)
        
        switch section {
        case itemSection.firstSection.hashValue:
            let collectionsPresenter = CollectionFavoritesModelView(product: product)
            let collectionsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionIdentifier", for: indexPath) as! CollectionItemViewCell
            collectionsCell.configure(with: collectionsPresenter)
            return collectionsCell
        case itemSection.secondSection.hashValue:
            let favoritesPresenter = FavoritesModelView(product: product)
            let favoritesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteIdentifier", for: indexPath) as! FavoriteItemViewCell
            favoritesCell.configure(with: favoritesPresenter)
            return favoritesCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (sections?.count)!
    }
}
