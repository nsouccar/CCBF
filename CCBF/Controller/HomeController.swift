//
//  ViewController.swift
//  CCBF
//
//  Created by Noa on 6/29/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import UIKit


class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuBar()

        navigationController?.navigationBar.isTranslucent = false
        
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-32, height: view.frame.height))
        titleLabel.text = "Schedule"
        titleLabel.textColor = Color.getColor(.grey)()
        let mapBUtton = UIBarButtonItem(title: "Map", style: .plain, target: self, action: #selector(pressed))
        //create a new button
        let button = UIButton(type: .custom)
        //set image for button
        button.setImage(UIImage(named: "logo.png"), for: .normal)
        //add function for button
        
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        //self.navigationItem.rightBarButtonItem = barButton
    
    
    //This method will call when you press button.
   

    
        navigationItem.titleView = titleLabel
        navigationItem.setRightBarButtonItems([barButton, mapBUtton], animated: true)
        
        setUpCollectionView()
     
}
    
    @objc func pressed() {
        
        present(MapController(), animated: true, completion: nil)
    }
    
    let cellID = ["GenreCell", "ScheduleCell", "AuthorCell", "SponsorCell"]

    
    func setUpCollectionView () {
        
        if let flowLayout = collectionView?.collectionViewLayout as?
            UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
            
        }
    collectionView?.backgroundColor = UIColor.white
    //collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellID[1])
        collectionView?.register(AuthorCellView.self, forCellWithReuseIdentifier: cellID[2])
    
        collectionView?.register(SponsorCell.self, forCellWithReuseIdentifier: cellID[3])
        collectionView?.register(GenreCell.self, forCellWithReuseIdentifier: cellID[0])
    //collectionView?.register(ScheduleCell.self, forCellWithReuseIdentifier: "cellID")
    collectionView?.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
    //navigationController?.hidesBarsOnSwipe = true

    collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    collectionView?.isPagingEnabled = true
        
    }
    
    
    func scrollToMenuIndex(menuIndex: Int ) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .left, animated: true)
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = titles[menuIndex]
        }
    }
    
    /*func hideNavBar(view: UICollectionViewDelegate) {
        if(view.panGestureRecognizer.translation(in: view.superview).y > 0) {
            print("yes")
            //Code will work without the animation block.I am using animation block incase if you want to set any delay to it.
            UIView.animate(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                self.navigationController?.setToolbarHidden(true, animated: true)
                print("Hide")
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 2.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(false, animated: true)
                self.navigationController?.setToolbarHidden(false, animated: true)
                print("Unhide")
            }, completion: nil)
        }
    }
    
    */
   lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.backgroundColor = UIColor.white
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.homeController = self
        return mb
    }()
    
    
    private func setupMenuBar() {
        
view.addSubview(menuBar)
     
NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", metrics: nil, views: ["v0":menuBar]))
NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(50)]",  metrics: nil, views: ["v0":menuBar]))
let guide = view.safeAreaLayoutGuide
menuBar.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true

    
}
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x/4
        
    }
    
    let titles = ["About", "Schedule", "Authors", "Sponsors"]
    
    override func  scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x/view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: .left)
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = titles[Int(index)]
        }
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID[indexPath.item], for: indexPath)
        //hideNavBar(view: cell as! UICollectionView)
        print(indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
    
    
    


 
}








