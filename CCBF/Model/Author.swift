//
//  Author.swift
//  CCBF
//
//  Created by Noa on 8/15/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import Foundation
import UIKit

class Author  {
    
    var name: String?
    var image: UIImageView?
    var blurb: String?
    var genres: [Genre]?
    var location: String?
    var bookImage: UIImageView?
    
    init(name: String, image: UIImageView, blurb: String, bookImage: UIImageView, location: String) {
        self.name = name
        self.image = image
        self.blurb = blurb
        self.bookImage = bookImage
        self.location = location
    }

}
