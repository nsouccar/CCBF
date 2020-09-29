//
//  AuthorsCell.swift
//  CCBF
//
//  Created by Noa on 8/12/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import UIKit

class AuthorCollectionViewCell: BaseCell {
   
    
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
   

var author: Author? {
        didSet {
            authorImageView.image = author?.image!.image!
            authorName.text = author?.name
            authorLocationLabel.text = author?.location
            
            
            
           
            }
    
    }
   
    @objc func buttonClicked(sender: UIButton!) {
        UIButton.animate(withDuration: 0.07, animations: {
            sender.backgroundColor = Color.getColor(.lightGrey)()
        }, completion: { finish in
           
                sender.backgroundColor = UIColor.white
        
        })
        
    
        let controller = AuthorBioController()
        controller.author = self.author
        self.superview?.findViewController()?.present(controller, animated: true, completion: nil)
        
    }
    
let thumbnailImageView: UIButton = {
        let imageView = UIButton()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        imageView.showsTouchWhenHighlighted = true
        
        return imageView
    }()
    

    let authorName: UILabel = {

        let authorLabel = UILabel()
        let customFont = UIFont(name: "InstantHarmonyDEMO-Regular", size: 35.0)

        authorLabel.text = ""
        authorLabel.textAlignment = .center
        authorLabel.textColor = UIColor.black
        authorLabel.minimumScaleFactor = 0
        authorLabel.font = customFont
        authorLabel.adjustsFontSizeToFitWidth = true
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
       
        return authorLabel
        
    }()
    
    var authorImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "the-great-jeff-75x100.jpg")
        view.layer.borderWidth = 0.5
        view.layer.masksToBounds = false
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = view.frame.size.height/2
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let authorLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "@ Tent A"
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    
    
    override func setupViews(){
        super.setupViews()
        
       

       
        addSubview(thumbnailImageView)
        thumbnailImageView.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
      
        thumbnailImageView.addSubview(authorImageView)
        thumbnailImageView.addSubview(authorName)
        thumbnailImageView.addSubview(authorLocationLabel)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]|", metrics: nil, views: ["v0":authorName]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-130-|", metrics: nil, views: ["v0":authorName]))
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(180)]", metrics: nil, views: ["v0":thumbnailImageView]))
       NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(180)]", metrics: nil, views: ["v0":thumbnailImageView]))
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-55-[v0(75)]", metrics: nil, views: ["v0":authorImageView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-45-[v0(99)]", metrics: nil, views: ["v0":authorImageView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", metrics: nil, views: ["v0":authorLocationLabel]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-149-[v0]", metrics: nil, views: ["v0":authorLocationLabel]))
      
        
        }
    
   
    
}
    


class GenreCell:  BaseCell{
    
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    var author: Author!
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        addSubview(self.scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
        
        //Constrain scroll view
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true;
        self.scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true;
        self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 50).isActive = true;
        self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20).isActive = true;
        
        //Add and setup stack view
        self.scrollView.addSubview(self.stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .vertical
        self.stackView.spacing = 10;
        
        //constrain stack view to scroll view
        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true;
        self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true;
        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true;
        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -50).isActive = true;
        
        //constrain width of stack view to width of self.view, NOT scroll view
        self.stackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true;
        
        //add image views to stack view
        
      
        
        
        let image = UIImage(named: "foodtrucks" )
        let mainImage = UIImage(named: "balloon")
        
        let resizedImage = ResizeImage(image: image!, targetSize: CGSize(width: 540, height: 699))
      
        //self.stackView.addArrangedSubview(kittenImageView1)
         let customFont = UIFont(name: "InstantHarmonyDEMO-Regular", size: 50.0)
       
        
        let authorName = UILabel()
       
        
        authorName.text = "Welcome!"
        authorName.textAlignment = .center
        authorName.textColor = Color.getColor(.blue)()
        authorName.minimumScaleFactor = 0
        authorName.font = customFont
        authorName.adjustsFontSizeToFitWidth = true
        authorName.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(authorName)
        
      
        
        
        
        
        
        let xPos = self.frame.width/2
        let width: CGFloat = 100.0
        let bookImage =  UIImageView(frame: CGRect(x: (xPos - width/2), y: 150, width: width, height: 500))
        bookImage.image = mainImage
        self.stackView.addArrangedSubview(bookImage)
        
        let aboutLabel = UILabel()
        
        aboutLabel.text = "About the Festival"
        aboutLabel.font = customFont
        aboutLabel.textColor = Color.getColor(.purple)()
        aboutLabel.textAlignment = .center
        aboutLabel.numberOfLines = 0
        aboutLabel.sizeToFit()
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(aboutLabel)
        
        
        let label = UILabel()
        label.text = "The Chappaqua Children’s Book Festival is a 501c3 nonprofit on a mission to put a book in the hands of every child. We produce one of the largest and most engaging annual book festivals in northeast."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = Color.getColor(.grey)()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(label)
        
        let festivalImage =  UIImageView(frame: CGRect(x: (xPos - width/2), y: 150, width: width, height: 500))
        festivalImage.image = UIImage(named: "festival")
        self.stackView.addArrangedSubview(festivalImage)
        
        let foodLabel = UILabel()
        
        foodLabel.text = "FOOD!"
        foodLabel.font = customFont
        foodLabel.textColor = Color.getColor(.orange)()
        foodLabel.textAlignment = .center
        foodLabel.numberOfLines = 0
        foodLabel.sizeToFit()
        foodLabel.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(foodLabel)
        
        let foodSubLabel = UILabel()
        foodSubLabel.text = "One can’t live by books alone..."
        foodSubLabel.textAlignment = .center
        foodSubLabel.numberOfLines = 0
        foodSubLabel.sizeToFit()
        foodSubLabel.textColor = Color.getColor(.grey)()
        foodSubLabel.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(foodSubLabel)
        
        let foodImage =  UIImageView(frame: CGRect(x: (xPos - width/2), y: 150, width: width, height: 500))
        foodImage.image = resizedImage
        self.stackView.addArrangedSubview(foodImage)
        
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
        
        func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            UIApplication.shared.open(URL)
            return false
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
    
   
    



