//
//  FavoritesCellProtocol.swift
//  favorites-demo
//
//  Created by Carlos Vázquez Gómez on 9/3/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit

protocol TextPresentable {
    var title: String { get }
    var counter: String { get}
}

protocol ImagePresentable {
    var mainImage: UIImage { get }
    var buttonImage: UIImage { get }
    var firstImage: UIImage { get }
    var secondImage: UIImage { get }
    var thirdImage: UIImage { get }
}

protocol ButtonPresentable {
    var favoriteOn: Bool { get }
    func onFavoriteToggle(option: Bool)
}
