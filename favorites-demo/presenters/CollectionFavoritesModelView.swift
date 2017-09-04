//
//  CollectionFavoritesModelView.swift
//  favorites-demo
//
//  Created by Carlos Vázquez Gómez on 9/3/17.
//  Copyright © 2017 fx. All rights reserved.
//

import Foundation

import UIKit

struct CollectionFavoritesModelView: TextWithImagePresentable {
    
    fileprivate var product: Product?
    
    init(product: Product) {
        self.product = product
    }
}

extension CollectionFavoritesModelView {
    
    var title: String { return "TBDString" }
    var counter: String { return "TBDString" }
    
    var placeHolderImage: UIImage { return UIImage(named: "unfavorited")! }
    var buttonImage: UIImage { return UIImage(named: "favorited")! }
    var mainImageUrl: URL { return URL(string: (product?.imageUrl)!)! }
}
