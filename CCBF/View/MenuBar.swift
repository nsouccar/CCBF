//
//  MenuBar.swift
//  CCBF
//
//  Created by Noa on 7/11/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import Foundation
import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate  = self
        return cv
        
    }()
    
    let cellId = "cellId"
    let imageNames = ["genres","schedule","authors",  "sponsor"]
 
    var homeController: HomeController?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", metrics: nil, views: ["v0":collectionView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", metrics: nil, views: ["v0":collectionView]))
        
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .centeredVertically)
        setupHorizontalBar()
    }
    
        required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    func setupHorizontalBar () {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = Color.getColor(.orange)()
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
             horizontalBarLeftAnchorConstraint =  horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
            horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = CGFloat(indexPath.item) * frame.width/4
        horizontalBarLeftAnchorConstraint?.constant = x
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
            }, completion: nil)
        homeController?.scrollToMenuIndex(menuIndex: indexPath.item)
        //print(indexPath.item)
        
        
        }
        
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named:imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        
        cell.tintColor = UIColor.rgb(red: 91, blue: 14, green: 13, alpha: 1)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/5, height: frame.height)
    }
    
    
 
    
}

class MenuCell: BaseCell {
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "schedule")
        
        iv.tintColor = Color.getColor(.blue)()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
        
    }()
    
    override var isHighlighted: Bool {
        didSet{
            imageView.tintColor = isHighlighted ? Color.getColor(.orange)() : Color.getColor(.blue)()
        }
    }
    
    override var isSelected: Bool {
        didSet{
            imageView.tintColor = isSelected ? Color.getColor(.orange)() : Color.getColor(.blue)()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-25-[v0(10)]-25-|", metrics: nil, views: ["v0":imageView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(20)]-10-|", metrics: nil, views: ["v0":imageView]))
        
        imageView.centerXAnchor.constraint(equalTo: self.trailingAnchor, constant: 8.0).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.bottomAnchor, constant: 1.0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.topAnchor).isActive = true
        

        //addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 4, constant: 4))
       //addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 4, constant: 4))
        
        }
    
    
  
}
