//
//  FavoriteSection.swift
//  favorites-demo
//
//  Created by Carlos Vázquez Gómez on 8/31/17.
//  Copyright © 2017 fx. All rights reserved.
//

import Foundation
import Unbox

struct FavoriteSection {
    let identifier: Int
    let name: String
    let description: String
    let defaultOption: Bool
    let owner: Owner
    let createdAt: String
    let visibility: String
    let products: [String: Product]
    
    func arrayProducts() -> [Product] {
        var array = [Product]()
        for product in products {
            array.append(product.value)
        }
        return array
    }
    
    func numberOfItems() -> Int {
        return self.products.count
    }
}

struct Owner {
    let name: String
    let email: String
    let linioId: String
}

struct Product {
    let identifier: Double
    let name: String
    let wishListPrice: Double
    let slug: String
    let url: String
    let imageUrl: String
    let linioPlusLevel: Int
    let conditionType: String
    let freeShipping: Bool
    let imported: Bool
    let active: Bool
}

extension FavoriteSection: Unboxable {
    init(unboxer: Unboxer) throws {
        identifier = try unboxer.unbox(key: "id")
        name = try unboxer.unbox(key: "name")
        description = try unboxer.unbox(key: "description")
        defaultOption = try unboxer.unbox(key: "default")
        owner = try unboxer.unbox(key: "owner")
        createdAt = try unboxer.unbox(key: "createdAt")
        visibility = try unboxer.unbox(key: "visibility")
        products = try unboxer.unbox(key: "products")
    }
}

extension Owner: Unboxable {
    init(unboxer: Unboxer) throws {
        name = try unboxer.unbox(key: "name")
        email = try unboxer.unbox(key: "email")
        linioId = try unboxer.unbox(key: "linioId")
    }
}

extension Product: Unboxable {
    init(unboxer: Unboxer) throws {
        identifier = try unboxer.unbox(key: "id")
        name = try unboxer.unbox(key: "name")
        wishListPrice = try unboxer.unbox(key: "wishListPrice")
        slug = try unboxer.unbox(key: "slug")
        url = try unboxer.unbox(key: "url")
        imageUrl = try unboxer.unbox(key: "image")
        linioPlusLevel = try unboxer.unbox(key: "linioPlusLevel")
        conditionType = try unboxer.unbox(key: "conditionType")
        freeShipping = try unboxer.unbox(key: "freeShipping")
        imported = try unboxer.unbox(key: "imported")
        active = try unboxer.unbox(key: "active")
    }
}




