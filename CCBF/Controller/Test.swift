//
//  Test.swift
//  CCBF
//
//  Created by Noa on 9/11/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    weak var collectionView: UICollectionView!
    var event: Event!
    let cellID = ["TitleCell", "Time", "Presenters", "Blurb"]

    var delegate: CellColor? = nil
    
    override func loadView() {
        super.loadView()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: collectionView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            ])
        self.collectionView = collectionView
        let navView = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        navView.backgroundColor = UIColor.white
        self.view.addSubview(navView)
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(backAction))
        //button.imageInsets = UIEdgeInsets(top: 5, left: 5, bottom: 12, right: 5)
        let navItem = UINavigationItem()
        navItem.leftBarButtonItem = button
       
       
        navView.items = [navItem]
        
        
    }
    
    @objc func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        collectionView.register(TitleCell.self, forCellWithReuseIdentifier: cellID[0])
        collectionView.register(DateandLocation.self, forCellWithReuseIdentifier: cellID[1])
    
        collectionView.register(Presenters.self, forCellWithReuseIdentifier: cellID[2])
        collectionView.register(GenresandBlurb.self, forCellWithReuseIdentifier: cellID[3])
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = .white

    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID[indexPath.item], for: indexPath) as! BaseEventCell
        cell.event = self.event
    
        
        delegate?.setCellColor(cell: cell)
        return cell

    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
                print("hihihi")
                print(self.view.frame.width)
                return CGSize(width: self.view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
