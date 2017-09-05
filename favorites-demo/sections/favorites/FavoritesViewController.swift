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
    fileprivate var sections: [FavoriteSection]?
    fileprivate var adapter: FavoritesViewAdapter?
    
    init(sections: [FavoriteSection]) {
        self.sections = sections
        super.init(nibName: "FavoritesViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.string(for: .Favoritos)
        adapter = FavoritesViewAdapter(collectionView: collectionView, sections: sections!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

}
