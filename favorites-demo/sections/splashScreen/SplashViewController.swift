//
//  SplashViewController.swift
//  favorites-demo
//
//  Created by Carlos Vázquez Gómez on 9/2/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    init() {
        super.init(nibName: "SplashViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
    }

}
