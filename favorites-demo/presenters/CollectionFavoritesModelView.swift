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
    
    fileprivate var section: FavoriteSection!
    
    init(section: FavoriteSection) {
        self.section = section
    }
}

extension CollectionFavoritesModelView {
    
    var title: String { return (section?.description)! }
    var counter: String! {return String(describing: section.products.count)}
    
    var placeHolderImage: UIImage { return UIImage(named: "unfavorited")! }
    var buttonImage: UIImage { return UIImage(named: "favorited")! }
    var firstImageUrl: URL { return URL(string: section.product(at: .first).imageUrl)! }
    var secondImageUrl: URL { return URL(string: section.product(at: .second).imageUrl)! }
    var thirdImageUrl: URL { return URL(string: section.product(at: .third).imageUrl)! }
}
