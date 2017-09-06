//
//  Constants.swift
//  favorites-demo
//
//  Created by Carlos Vazquez Gomez on 9/5/17.
//  Copyright © 2017 fx. All rights reserved.
//

import Foundation

struct Constants {
    
    enum Key: String {
        case new
        case refurbished
        case favorited
        case FreeShippingSquare
        case FullfillSquare
        case GarantiaSquare
        case InternationalSquare
        case NewSquare
        case Plus48Square
        case PlusSquare
        case RefurbishedSquare
        case placeholder
        case titleCollectionSection
        case titleFavoritesSection
    }
    
    static func string(for key: Key) -> String {
        return NSLocalizedString(key.rawValue, comment: "")
    }
}
