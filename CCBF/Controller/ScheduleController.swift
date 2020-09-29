//
//  ScheduleController.swift
//  CCBF
//
//  Created by Noa on 9/10/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import Foundation
import UIKit

class ScheduleController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
  
    var event: Event!
    let cellID = ["Time", "Presenters", "Blurb"]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(collectionView)
        collectionView.delegate   = self
        collectionView.dataSource = self
       
       
        
        collectionView.backgroundColor = UIColor.white
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DateandLocation.self, forCellWithReuseIdentifier: cellID[0])
        collectionView.register(Presenters.self, forCellWithReuseIdentifier: cellID[1])
        collectionView.register(GenresandBlurb.self, forCellWithReuseIdentifier: cellID[2])
      
        
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID[indexPath.item], for: indexPath)
            cell.backgroundColor = UIColor.white
       
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    

    
    
}

class ScheduleControllerCell: BaseCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.setupViews()
        backgroundColor = Color.getColor(.lightGrey)()
        /* collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", metrics: nil, views: ["v0":collectionView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", metrics: nil, views: ["v0":collectionView]))
        addSubview(collectionView)
        collectionView.backgroundColor = UIColor.white
        //collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(DateandLocation.self, forCellWithReuseIdentifier: cellID[0])
        collectionView.register(Presenters.self, forCellWithReuseIdentifier: cellID[1])
        collectionView.register(GenresandBlurb.self, forCellWithReuseIdentifier: cellID[2])
        
        */
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

protocol CellColor {
    func setCellColor(cell: UICollectionViewCell)
    var cellColor: UIColor? {get set}
}

