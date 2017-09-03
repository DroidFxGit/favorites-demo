//
//  FavoritesModelView.swift
//  favorites-demo
//
//  Created by Carlos Vázquez Gómez on 9/3/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit

struct FavoritesModelView: ImageWithButtonPresentable {
    
    fileprivate var sections: [FavoriteSection]?
    
    init(sections: [FavoriteSection]) {
        self.sections = sections
    }
}

extension FavoritesModelView {
    var mainImage: UIImage { return UIImage(named: "favorited")! }
    var buttonImage: UIImage { return UIImage(named: "favorited")! }
    var firstImage: UIImage { return UIImage(named: "favorited")! }
    var secondImage: UIImage { return UIImage(named: "favorited")! }
    var thirdImage: UIImage { return UIImage(named: "favorited")! }
}


extension FavoritesModelView {
    var favoriteOn: Bool { return true }
    
    func onFavoriteToggle(option: Bool) {
        //TODO:
    }
}
