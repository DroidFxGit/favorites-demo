//
//  FavoritesViewAdapter.swift
//  favorites-demo
//
//  Created by Carlos Vázquez Gómez on 9/2/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit

enum itemSection {
    case firstSection
    case secondSection
}

class FavoritesViewAdapter: NSObject {
    
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
        collectionView?.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerIdentifier")
    }
    
    fileprivate func configureItemsLayout() {
        let layout = FavoritesCollectionViewFlowLayout(collection: collectionView!)
        collectionView!.collectionViewLayout = layout
    }
}

extension FavoritesViewAdapter: UICollectionViewDelegate {
}

extension FavoritesViewAdapter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == itemSection.secondSection.hashValue {
            let width = collectionView.frame.width
            return CGSize(width: (width - 5)/2.2, height: (width - 5)/2.2)
        }
        else {
            return CGSize(width: 174, height: 178)
        }
        
    }
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = indexPath.section
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerIdentifier", for: indexPath) as? CollectionHeaderView else { return UICollectionReusableView() }
            
        let presenter = HeaderTitleModelView(section: section, counter: totalProducts.count)
        headerView.configure(with: presenter)
        return headerView
    }
    
}
