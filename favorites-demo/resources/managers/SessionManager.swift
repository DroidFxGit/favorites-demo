//
//  SessionManager.swift
//  favorites-demo
//
//  Created by Carlos Vázquez Gómez on 9/2/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit

class SessionManager: NSObject {
    
    fileprivate weak var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        super.init()
    }
    
    func configureMainScreen() {
        let splash = SplashViewController()
        configureRootView(with: splash)
        obtainFavoritesToShow()
    }
    
    fileprivate func obtainFavoritesToShow() {
        let service = FavoriteSectionsService()
        service.favoriteSectionsFromService { (sections, error) in
            if sections != nil {
                let favoritesView = FavoritesViewController(sections: sections!)
                let navigation = UINavigationController(rootViewController: favoritesView)
                self.configureRootView(with: navigation)
            }
        }
    }
    
    fileprivate func configureRootView(with view: UIViewController) {
        window?.rootViewController = nil
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
