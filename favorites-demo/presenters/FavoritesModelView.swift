//
//  FavoritesModelView.swift
//  favorites-demo
//
//  Created by Carlos Vázquez Gómez on 9/3/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit

struct FavoritesModelView: ImageWithButtonPresentable {
    
    fileprivate var product: Product?
    
    init(product: Product) {
        self.product = product
    }
}

extension FavoritesModelView {
    var buttonImage: UIImage { return UIImage(named: "favorited")! }
    var placeHolderImage: UIImage { return UIImage(named: "unfavorited")! }
    var mainImageUrl: URL { return URL(string: (product?.imageUrl)!)! }
}


extension FavoritesModelView {
    var favoriteOn: Bool { return true }
    
    func onFavoriteToggle(option: Bool) {
        //TODO:
    }
}
