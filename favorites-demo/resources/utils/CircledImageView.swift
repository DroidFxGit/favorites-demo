//
//  CircledImageView.swift
//  favorites-demo
//
//  Created by Carlos Vázquez Gómez on 9/5/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit

class CircledImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }

}
