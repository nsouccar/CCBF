//
//  AuthorPageController.swift
//  CCBF
//
//  Created by Noa on 8/16/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import Foundation
import UIKit
import SwiftSoup

class AuthorCellView: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let colorGen = ColorGenerator()
    
    
    
    
    lazy var collectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Color.getColor(.lightGrey)()
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    let cellId = "cellId"

    var estimateWidth = 150.0
    var cellMarginSize = 5.0
    
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
        collectionView.register(MyHeaderFooterClass.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "Footer")
        self.setupGridView()
        
    
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppDelegate.authors!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AuthorCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 5
        cell.author = AppDelegate.authors![indexPath.item]
        cell.authorName.textColor = colorGen.randColor()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.getWidth()
        return CGSize(width: width, height: width)
    }
    
    
    func getWidth() -> CGFloat {
        let estimatedWidth = CGFloat(self.estimateWidth)
        let cellCount = floor(CGFloat(self.collectionView.frame.size.width)/estimatedWidth)
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.collectionView.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin)/cellCount
    
        return width
    }
    
    func setupGridView() {
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
        flow.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
}


protocol AuthorPageControllerDelegate: class {
    func presentController()
}

