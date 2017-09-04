//
//  FavoriteSectionsService.swift
//  favorites-demo
//
//  Created by Carlos Vázquez Gómez on 8/31/17.
//  Copyright © 2017 fx. All rights reserved.
//

import UIKit
import Unbox

typealias requestCompletionHandler = ([FavoriteSection]?, Error?) -> Void
typealias imageCompletionHandler = (UIImage?, Error?) -> Void

class FavoriteSectionsService: NSObject {
    
    fileprivate let  url = "https://gist.githubusercontent.com/la-ursic/3c5f25d5ee955ee9a6e493ac57884b9c/raw/5fab9af8e1f4db60419ba3a8da9f138cbb3a8461/Wish%2520lists"
    
    func favoriteSectionsFromService(completion: @escaping requestCompletionHandler) {
        
        let url = URL(string: self.url)!
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if data != nil {
                do {
                    let sections: [FavoriteSection] = try unbox(data: data!)
                    completion(sections, nil)
                }catch {
                    completion(nil, error)
                }
            }
            else {
                completion(nil, error)
            }
           
        }
        
        task.resume()
    }
    
}
