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
    var counter: String! { get}
}

protocol ImagePresentable {
    var buttonImage: UIImage { get }
    var placeHolderImage: UIImage { get }
}

protocol UrlPresentable {
    var mainImageUrl: URL { get }
}

protocol BadgesViewPresentable {
    var badgesView: BadgesView { get }
}

protocol TitleHeaderPresentable {
    var titleHeaderText: String { get }
}

protocol UrlCollectionPresentable {
    var firstImageUrl: URL { get }
    var secondImageUrl: URL { get }
    var thirdImageUrl: URL { get }
}

protocol ButtonPresentable {
    var favoriteOn: Bool { get }
    func onFavoriteToggle(option: Bool)
}
