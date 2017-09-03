//
//  FavoriteItemViewCell.swift
//  favorites-demo
//
//  Created by Carlos Vazquez Gomez on 8/30/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit

typealias ImageWithButtonPresentable = ImagePresentable & ButtonPresentable

class FavoriteItemViewCell: UICollectionViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    private var delegate: ImageWithButtonPresentable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with presenter: ImageWithButtonPresentable) {
        delegate = presenter
        
        mainImageView.image = presenter.mainImage
        
        let imageButton = presenter.buttonImage
        favoriteButton.setBackgroundImage(imageButton, for: .normal)
        
    }

    @IBAction func onFavoriteAction(_ sender: Any) {
        //TODO: send correct status to delegate
//        delegate?.onFavoriteToggle(option: sender as! Bool)
    }
    
}
