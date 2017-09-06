//
//  HeaderTitleModelView.swift
//  favorites-demo
//
//  Created by Carlos Vázquez Gómez on 9/5/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit

struct HeaderTitleModelView: TitleHeaderPresentable {
    
    fileprivate var section: Int!
    fileprivate var counter: Int!
    
    init(section: Int, counter: Int) {
        self.section = section
        self.counter = counter
    }
}

extension HeaderTitleModelView {
    var titleHeaderText: String {
        return (section == itemSection.firstSection.hashValue) ?
            Constants.string(for: .titleFavoritesSection) :
            Constants.string(for: .titleCollectionSection) + " (" + String(counter) + ")"
    }
}
