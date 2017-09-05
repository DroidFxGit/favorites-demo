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
    
    fileprivate let numberOfSections = 2
    fileprivate var sections: [FavoriteSection]!
    fileprivate var totalProducts: [Product]!
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
        totalProducts = [Product]()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.register(UINib(nibName: "CollectionItemViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionIdentifier")
        collectionView?.register(UINib(nibName: "FavoriteItemViewCell", bundle: nil), forCellWithReuseIdentifier: "favoriteIdentifier")
    }
    
    fileprivate func configureItemsLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        layout.itemSize = CGSize(width: 174, height: 174)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        collectionView!.collectionViewLayout = layout
    }
}

extension FavoritesViewAdapter: UICollectionViewDelegate {
}

extension FavoritesViewAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        totalProducts? += sections![section].products.values
        
        switch section {
        case itemSection.firstSection.hashValue:
            return sections.count
        case itemSection.secondSection.hashValue:
            return totalProducts.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        
        switch section {
        case itemSection.firstSection.hashValue:
            let item: FavoriteSection = sections[indexPath.row]
            let collectionsPresenter = CollectionFavoritesModelView(section: item)
            let collectionsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionIdentifier", for: indexPath) as! CollectionItemViewCell
            collectionsCell.configure(with: collectionsPresenter)
            return collectionsCell
        case itemSection.secondSection.hashValue:
            let product = totalProducts[indexPath.row]
            let favoritesPresenter = FavoritesModelView(product: product)
            let favoritesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteIdentifier", for: indexPath) as! FavoriteItemViewCell
            favoritesCell.configure(with: favoritesPresenter)
            return favoritesCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
}
