//
//  FavoritesViewController.swift
//  favorites-demo
//
//  Created by Carlos Vazquez Gomez on 8/30/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = FavoriteSectionsService()
        service.favoriteSectionsFromService { (sections, error) in
            print("niceee!!!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
