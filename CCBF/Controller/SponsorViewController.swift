//
//  SponsorViewController.swift
//  CCBF
//
//  Created by Noa on 9/12/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import Foundation
import UIKit



class SponsorViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    var i = 0
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }
    
    @objc func backAction(selector: UIButton!) {
        dismiss(animated: true, completion: nil)

    }
    
   
    let sponsorTypes = ["Masterpiece Sponsors", "Classic Sponsors", "Page Turner Sponsors"
        , "Ready to Read Sponsors",
]
    
    let images: [UIImage] = [UIImage(named: "trophy")!, UIImage(named: "star")!, UIImage(named: "bookmark")!, UIImage(named: "like")!]
    
    var sponsorStuffies: [SponsorStuff] = {
        let one = SponsorStuff()
        one.sponsorImages =  [UIImage(named: "m1"), UIImage(named: "m2"), UIImage(named: "m3"), UIImage(named: "m4")]
            
        
        let two = SponsorStuff()
            two.sponsorImages =  [UIImage(named: "p1"), UIImage(named: "p2"), UIImage(named: "p3"), UIImage(named: "p4"), UIImage(named: "p5"), UIImage(named: "p6")]
        let three = SponsorStuff()
            three.sponsorImages = [UIImage(named: "r1"), UIImage(named: "r2"), UIImage(named: "r3"), UIImage(named: "r4"), UIImage(named: "r5"), UIImage(named: "r6"), UIImage(named: "r7"), UIImage(named: "r8"), UIImage(named: "r9"), UIImage(named: "r10"), UIImage(named: "r11"), UIImage(named: "r12"),
        UIImage(named: "r13"), UIImage(named: "r14"), UIImage(named: "r15"), UIImage(named: "r12"), UIImage(named: "r16"), UIImage(named: "r17"),UIImage(named: "r18"), UIImage(named: "r19"), UIImage(named: "r20"), UIImage(named: "r21"),UIImage(named: "r22"), UIImage(named: "r23"), UIImage(named: "r24"), UIImage(named: "r25"), UIImage(named: "r26"), UIImage(named: "r27"), UIImage(named: "r28"), UIImage(named: "r29"), UIImage(named: "r30")]
        let four = SponsorStuff()
        four.sponsorImages = [UIImage(named: "c1"), UIImage(named: "c2"), UIImage(named: "c3"), UIImage(named: "c4"), UIImage(named: "c5"), UIImage(named: "c7"), UIImage(named: "c8"), UIImage(named: "c9"), UIImage(named: "c10"), UIImage(named: "c11"), UIImage(named: "c12"), UIImage(named: "c13"), UIImage(named: "c14"), UIImage(named: "c15"), UIImage(named: "c16"), UIImage(named: "c17"), UIImage(named: "cl6")]

    
        
        return [one, two, three, four]
    }()
    //let sponsors = [UIImage(named: "masterpiece")!, UIImage(named: "classic")!, UIImage(named: "pageturner")!, UIImage(named: "ready1")!]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 100, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.width, height: 400)
    
        
        let myCollectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self

        myCollectionView.register(SponsorCelly.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = UIColor.white
        
        self.view.addSubview(myCollectionView)
        let navView = UINavigationBar(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 50))
        navView.backgroundColor = Color.getColor(.orange)()
        
        self.view.addSubview(navView)
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(backAction))
        let navItem = UINavigationItem()
        navItem.leftBarButtonItem = button
        let label = UILabel(frame: CGRect(x: 140 , y: 20, width: 200, height: 20))
        label.text = "Our Sponsors"
        label.textColor = .white
        navView.addSubview(label)
        
        navView.items = [navItem]
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! SponsorCelly
        myCell.backgroundColor = UIColor.white
        myCell.icon.image = images[indexPath.section]
        myCell.title.text = sponsorTypes[indexPath.section]
        myCell.collectionView.images = sponsorStuffies[i].sponsorImages
        if i < 3 {
        i += 1
        }else {
            i = 0
        }
     
        return myCell
    }
    
   
    
  
 
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height:  size.height * widthRatio)
            
        }
        
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}
class SponsorCelly: BaseCell {
    
    var icon: UIImageView!
    var title: UILabel!
    var collectionView: SponsorCollectionView!
   
override func setupViews() {
        super.setupViews()
        drawDottedLine(start: CGPoint(x: 0, y: self.frame.height), end: CGPoint(x: self.frame.width, y: self.frame.height), view: self)
        
        let width: CGFloat = 50.0
        let xPos = (self.frame.width - width)/2
        
         icon = UIImageView(frame: CGRect(x: xPos, y: 0, width: 50, height: 50))
         title = UILabel(frame: CGRect(x: 0, y: 50, width: self.frame.width, height: 20))
         title.textColor = Color.getColor(.grey)()
         title.textAlignment = .center
        
         collectionView = SponsorCollectionView(frame: CGRect(x: 0, y: 70, width: self.frame.width, height: self.frame.height - 70))
 
        

        
        addSubview(icon)
        addSubview(title)
        addSubview(collectionView)
        
    }
    
    func drawDottedLine(start p0: CGPoint, end p1: CGPoint, view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = Color.getColor(.orange)().cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.
        
        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
    }
    
    

}

class SponsorCollectionView:  UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
   
     var images: [UIImage?]!
    
    lazy var collectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    let cellId = "cellId"

    
        override init(frame: CGRect) {
        super.init(frame: frame)
       
        backgroundColor = Color.getColor(.lightGrey)()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", metrics: nil, views: ["v0":collectionView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", metrics: nil, views: ["v0":collectionView]))
        addSubview(collectionView)
        self.setupGridView()

        
       
    
        collectionView.register(SponsorCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       


        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SponsorCollectionViewCell
        print(indexPath.item)
        let resizedImage = ResizeImage(image: images[indexPath.item]!, targetSize: CGSize(width: cell.frame.width, height: cell.frame.height))
        cell.addSubview(UIImageView(image: resizedImage))
        
        cell.backgroundColor = UIColor.white
      
        return cell
    }
    
     func ResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height:  size.height * widthRatio)
            
        }
        
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func setupGridView() {
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(5)
        flow.minimumLineSpacing = CGFloat(5)
        flow.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    

    
   
    
    
}

class SponsorCollectionViewCell: BaseCell {
    override func setupViews() {
        super.setupViews()
    }
    
    
    
}





