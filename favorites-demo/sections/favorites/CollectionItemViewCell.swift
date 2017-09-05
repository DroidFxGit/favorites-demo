//
//  CollectionItemViewCell.swift
//  favorites-demo
//
//  Created by Carlos Vazquez Gomez on 8/30/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit
import SDWebImage

typealias TextWithImagePresentable = TextPresentable & ImagePresentable & UrlCollectionPresentable

class CollectionItemViewCell: UICollectionViewCell {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    
    fileprivate var delegate: TextWithImagePresentable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with presenter: TextWithImagePresentable) {
        delegate = presenter
        
        firstImageView.sd_setImage(with: presenter.firstImageUrl, placeholderImage: presenter.placeHolderImage, options: .refreshCached)
        secondImageView.sd_setImage(with: presenter.secondImageUrl, placeholderImage: presenter.placeHolderImage, options: .refreshCached)
        thirdImageView.sd_setImage(with: presenter.thirdImageUrl, placeholderImage: presenter.placeHolderImage, options: .refreshCached)
        
        titleLabel.text = presenter.title
        counterLabel.text = presenter.counter
    }

}
