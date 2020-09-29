//
//  AuthorBioController.swift
//  CCBF
//
//  Created by Noa on 9/1/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import Foundation
import UIKit

class AuthorBioController: UIViewController {
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    var author: Author!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        //Add and setup scroll view
        self.view.addSubview(self.scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
        
        //Constrain scroll view
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true;
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true;
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true;
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true;
        
        //Add and setup stack view
        self.scrollView.addSubview(self.stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .vertical
        self.stackView.spacing = 10;
        
        //constrain stack view to scroll view
        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true;
        self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 50).isActive = true;
        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true;
        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true;
        
        //constrain width of stack view to width of self.view, NOT scroll view
        self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true;
        
        //add image views to stack view
        
        let navView = UINavigationBar(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 50))
        navView.backgroundColor = UIColor.white
        self.view.addSubview(navView)
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(backAction))
        let navItem = UINavigationItem()
        navItem.leftBarButtonItem = button
        navView.items = [navItem]
        
        
        
        let kittenImageView1 = UIImageView(image: UIImage(named: "bigabbott"))
        //self.stackView.addArrangedSubview(kittenImageView1)
       
        
        let authorName = UILabel()
        let customFont = UIFont(name: "InstantHarmonyDEMO-Regular", size: 50.0)
        
        authorName.text = self.author.name
        authorName.textAlignment = .center
        authorName.textColor = UIColor.gray
        authorName.minimumScaleFactor = 0
        authorName.font = customFont
        authorName.adjustsFontSizeToFitWidth = true
        authorName.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(authorName)
        let xPos = self.view.frame.width/2
        let width: CGFloat = 100.0
        let bookImage =  UIImageView()
        let rImage = ResizeImage(image: author.bookImage!.image!, targetSize: CGSize(width: self.view.frame.width, height: 451 * (self.view.frame.width/451)))
        bookImage.image = rImage
        self.stackView.addArrangedSubview(bookImage)
        
        let label = UILabel()
        label.text = author.blurb
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = Color.getColor(.grey)()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(label)
        
        
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
    
    @objc func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
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



