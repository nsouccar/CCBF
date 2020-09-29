//
//  GenreCollectionViewCell.swift
//  CCBF
//
//  Created by Noa on 8/22/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import Foundation
import UIKit

class GenreCollectionViewCell: BaseCell {
    
    var genre: GenreImage? {
        didSet {
            thumbnailImageView.image = genre?.image
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath)
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 5
        return cell
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    
    
    override func setupViews(){
        super.setupViews()
        addSubview(thumbnailImageView)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", metrics: nil, views: ["v0":thumbnailImageView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", metrics: nil, views: ["v0":thumbnailImageView]))
       
        }
    
}

