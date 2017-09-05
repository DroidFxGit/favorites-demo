//
//  BadgesView.swift
//  favorites-demo
//
//  Created by Carlos Vazquez Gomez on 9/5/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit
import Foundation

class BadgesView: UIView {
    
    fileprivate var product: Product?
    fileprivate var bagdes: [String]!
    
    init(product: Product) {
        self.product = product
        super.init(frame: .zero)
        self.bagdes = badgesAttributes()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func view() -> BadgesView? {
        
        let view: BadgesView = self
        view.frame = dynamicFrame()
        view.backgroundColor = .clear
        var posY: CGFloat = 0.0
        
        for item in self.bagdes! {
            let image = UIImage(named: item)
            let imageView = UIImageView(image: image)
            
            imageView.frame = CGRect(x: 0.0, y: posY, width: 30.0, height: 30.0)
            view.addSubview(imageView)
            posY += 30.0
        }
        
        return view
    }
    
    fileprivate func dynamicFrame() -> CGRect {
        let height = CGFloat(self.bagdes.count) * 30.0
        let width: CGFloat = 30.0
        return CGRect(x: 0.0, y: 0.0, width: width, height: height)
    }
    
    fileprivate func badgesAttributes() -> [String] {
        var badges = [String]()
        
        if product?.linioPlusLevel == 1 {
            badges.append(Constants.string(for: .PlusSquare))
        }
        if product?.linioPlusLevel == 2 {
            badges.append(Constants.string(for: .Plus48Square))
        }
        if product?.conditionType == Constants.string(for: .refurbished) {
            badges.append(Constants.string(for: .RefurbishedSquare))
        }
        if product?.conditionType == Constants.string(for: .new) {
            badges.append(Constants.string(for: .NewSquare))
        }
        if (product?.freeShipping)! {
            badges.append(Constants.string(for: .FreeShippingSquare))
        }
        if (product?.imported)! {
            badges.append(Constants.string(for: .InternationalSquare))
        }
        
        return badges
    }

}
