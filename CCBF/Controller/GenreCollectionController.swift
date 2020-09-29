//
//  GenreCollectionController.swift
//  CCBF
//
//  Created by Noa on 8/22/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import Foundation
import UIKit

class GenreController: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Color.getColor(.lightGrey)()
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    let cellId = "cellId"
    var genres: [GenreImage] = {
        var firstGenre = GenreImage()
        firstGenre.image = UIImage(named: "kids") 
        return [firstGenre]
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.setupViews()
        backgroundColor = Color.getColor(.lightGrey)()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", metrics: nil, views: ["v0":collectionView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", metrics: nil, views: ["v0":collectionView]))
        addSubview(collectionView)
        collectionView.register(AuthorCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GenreCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.genre = genres[indexPath.item]
        return cell
    }
    
    
}
