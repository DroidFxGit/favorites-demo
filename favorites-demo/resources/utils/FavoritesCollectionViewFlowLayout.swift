//
//  FavoritesCollectionViewFlowLayout.swift
//  favorites-demo
//
//  Created by Carlos Vázquez Gómez on 9/5/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit

class FavoritesCollectionViewFlowLayout: UICollectionViewFlowLayout {
    fileprivate var collection: UICollectionView!
    fileprivate let kHeaderHeight: CGFloat = 60.0
    fileprivate let kEdgeInsetBroads: CGFloat = 5.0
    fileprivate let kEdgeInsetSides: CGFloat = 10.0
    fileprivate let kItemSize: CGFloat = 174.0
    fileprivate let kZeroSize: CGFloat = 0.0
    
    init(collection: UICollectionView) {
        self.collection = collection
        super.init()
        applyLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func applyLayout() {
        self.headerReferenceSize = CGSize(width: collection.frame.size.width, height: kHeaderHeight)
        self.sectionInset = UIEdgeInsets(top: kEdgeInsetBroads, left: kEdgeInsetSides, bottom: kEdgeInsetBroads, right: kEdgeInsetSides)
        self.minimumInteritemSpacing = kZeroSize
        self.minimumLineSpacing = kEdgeInsetSides
    }
}
