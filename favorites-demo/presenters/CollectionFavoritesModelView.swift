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
    
    fileprivate var sections: [FavoriteSection]?
    
    init(sections: [FavoriteSection]) {
        self.sections = sections
    }
}

extension CollectionFavoritesModelView {
    
    var title: String { return "TBDString" }
    var counter: String { return "TBDString" }
    
    var mainImage: UIImage { return UIImage(named: "favorited")! }
    var buttonImage: UIImage { return UIImage(named: "favorited")! }
    var firstImage: UIImage { return UIImage(named: "favorited")! }
    var secondImage: UIImage { return UIImage(named: "favorited")! }
    var thirdImage: UIImage { return UIImage(named: "favorited")! }
}
