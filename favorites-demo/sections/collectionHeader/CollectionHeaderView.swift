//
//  CollectionHeaderView.swift
//  favorites-demo
//
//  Created by Carlos Vazquez Gomez on 9/5/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {

    @IBOutlet weak var titleSectionLabel: UILabel!
    fileprivate var delegate: TitleHeaderPresentable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with presenter: TitleHeaderPresentable) {
        delegate = presenter
        titleSectionLabel.text = presenter.titleHeaderText
    }
    
}
