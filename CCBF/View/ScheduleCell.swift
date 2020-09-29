//
//  ScheduleCell.swift
//  CCBF
//
//  Created by Noa on 7/11/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import Foundation
import UIKit
class BaseCell: UICollectionViewCell, CellColor {
    
    let colorGenerator = ColorGenerator()
     var cellColor: UIColor?

   
    func setCellColor(cell: UICollectionViewCell) {
        cell.backgroundColor = cellColor
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellColor = colorGenerator.randColor2()

        setupViews()
}
    
    func setupViews(){}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
class ScheduleCell: BaseCell {
    
   
    var event: Event? {
        didSet {
            eventLabel.text = event?.title
            iconImage.image = UIImage(named: (event?.thumbnailImage)!.rawValue)
            genreLabel.text = event?.thumbnailImage?.rawValue
            locationLabel.text = event?.location
            eventTimeLabel.text = event?.time
            }
    }
    
    
    let eventLabel: UILabel = {
        let eventLabelView = UILabel()
        let customFont = UIFont(name: "InstantHarmonyDEMO-Regular", size: 35.0)

        eventLabelView.text = "Story Time with Brian Lies"
        eventLabelView.textAlignment = .center
        eventLabelView.minimumScaleFactor = 0
        
        eventLabelView.font = UIFont.systemFont(ofSize: 35.0)
        eventLabelView.textColor = Color.getColor(.otherBlue)()
        eventLabelView.adjustsFontSizeToFitWidth = true
        eventLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        return eventLabelView
        
    }()
    
    let eventTimeLabel:UILabel = {
        let eventTimeLabelView = UILabel()
        eventTimeLabelView.text = "From 10:00 to 11:00"
        eventTimeLabelView.textAlignment = .left
        eventTimeLabelView.minimumScaleFactor = 0
        eventTimeLabelView.font = UIFont.boldSystemFont(ofSize: 25.0)
        eventTimeLabelView.adjustsFontSizeToFitWidth = true
        eventTimeLabelView.textColor = UIColor.black
        eventTimeLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        return eventTimeLabelView
    }()
    
    let locationLabel:UILabel = {
        let locationLabelView = UILabel()
        locationLabelView.text = "Located at Tent A"
        locationLabelView.textAlignment = .center
        locationLabelView.textColor = Color.getColor(.grey)()
        
        locationLabelView.font = UIFont.boldSystemFont(ofSize: 15.0)
        
        
        
        locationLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        return locationLabelView
    }()
    
    
    
    let thumbnailImageView: UIButton = {
        let imageView = UIButton()
        CustomButton.addDashedBottomBorder(to: imageView)
        imageView.backgroundColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.showsTouchWhenHighlighted = true

        
        
        return imageView
    }()
    
    let iconImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "fiction.png")
        view.tintColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let divider: UIView = {
        let line = UIView()
        line.backgroundColor = Color.getColor(.lightGrey)()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
        
        
    }()
    
    let genreLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = UIColor.black

        return label
        
    }()
    
    let sideLine: UIView =  {
        let line = UIView()
        line.backgroundColor = Color.getColor(.lightGrey)()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    
    
    override func setupViews(){
        super.setupViews()
        addSubview(thumbnailImageView)
        
       
        thumbnailImageView.addSubview(eventLabel)

        thumbnailImageView.addSubview(locationLabel)

        thumbnailImageView.addSubview(sideLine)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-6-[v0]-6-|", metrics: nil, views: ["v0":thumbnailImageView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-6-[v0]-6-|", metrics: nil, views: ["v0":thumbnailImageView]))
    
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-|", metrics: nil, views: ["v0":eventLabel]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(50)]-45-|", metrics: nil, views: ["v0":eventLabel]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-10-|", metrics: nil, views: ["v0":locationLabel]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[v0(50)]-10-|", metrics: nil, views: ["v0":locationLabel]))
       
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(10)]", metrics: nil, views: ["v0":sideLine]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(1)]|", metrics: nil, views: ["v0":sideLine]))
  
        
        }
    
    

    
}
