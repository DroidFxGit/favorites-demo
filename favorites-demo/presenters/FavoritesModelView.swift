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
    var buttonImage: UIImage { return UIImage(named: Constants.string(for: .favorited))! }
    var placeHolderImage: UIImage { return UIImage(named: Constants.string(for: .placeholder))! }
    var mainImageUrl: URL { return URL(string: (product?.imageUrl)!)! }
}

extension FavoritesModelView {
    var badgesView: BadgesView { return BadgesView(product: product!).view()! }
}


extension FavoritesModelView {
    var favoriteOn: Bool { return true }
    
    func onFavoriteToggle(option: Bool) {
        //TODO:
    }
}
