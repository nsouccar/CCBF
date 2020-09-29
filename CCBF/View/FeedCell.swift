//
//  FeedCell.swift
//  CCBF
//
//  Created by Noa on 7/20/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import UIKit

class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let cg = ColorGenerator()

    var events: [Event] = {
        var firstEvent = Event()
        firstEvent.title = "Festival Opens!"
        firstEvent.thumbnailImage = .Fiction
        firstEvent.time = "10am"
        firstEvent.location = "Food Trucks Arrive! Fun Zone Kicks off! | 10am"
        firstEvent.blurb = "Fun times"
        firstEvent.thumbnailImage = Genre.Interactive
        var secondEvent = Event()
        secondEvent.title = "Author Talk with Jarrett J. Krosoczka"
        secondEvent.thumbnailImage = .Nonfiction
        secondEvent.location = "The Stage | 10am"
        secondEvent.time = "10am"
        secondEvent.thumbnailImage = Genre.Interactive

        var thirdEvent = Event()
        thirdEvent.title = "Storytime with Jason Carter Eaton"
        thirdEvent.time = "10:30am"
        thirdEvent.location = "The Gazebo | 10:30am"
        thirdEvent.thumbnailImage = .Kids
        thirdEvent.thumbnailImage = Genre.Interactive

        var fourthEvent = Event()
        fourthEvent.title = "Author Talk: Books, Kids Emotions"
        fourthEvent.time = "11: 00 am"
        fourthEvent.location = "The Stage | 11am"
        fourthEvent.thumbnailImage = .Kids
        fourthEvent.thumbnailImage = Genre.Interactive

        var fifthEvent = Event()
        fifthEvent.title = "Storytime with Sharee Miller"
        fifthEvent.time = "11:00 am"
        fifthEvent.location = "The Gazebo | 11am"
        fifthEvent.thumbnailImage = .Kids
        
        var sixthEvent = Event()
        sixthEvent.title = "Storytime with Mia Wenjen"
        sixthEvent.time = "11:30am"
        sixthEvent.location = "The Gazebo | 11:30am"
        sixthEvent.thumbnailImage = Genre.Interactive

        var seventhEvent = Event()
        seventhEvent.title = "Storytime with Mia Wenjen"
        seventhEvent.time = "11:30am"
        seventhEvent.location = "The Gazebo | 11:30am"
        seventhEvent.thumbnailImage = .Kids
        var eighthEvent = Event()
        eighthEvent.title = "Author Talk: Project Lit Panel"
        eighthEvent.time = "12pm"
        eighthEvent.location = "The Stage | 12pm"
        eighthEvent.thumbnailImage = Genre.Interactive

        var ninthEvent = Event()
        ninthEvent.title = "Storytime with Cynthia & Sanford Levsion"
        ninthEvent.time = "12:30pm"
        ninthEvent.location = "The Gazebo | 12:30pm"
        ninthEvent.thumbnailImage = Genre.Interactive

        var tenthEvent = Event()
        tenthEvent.title = "Author Talk: Girls in the World"
        tenthEvent.time = "1pm"
        tenthEvent.location = "The Stage | 1pm"
        tenthEvent.thumbnailImage = Genre.Interactive

        var eleventhEvent = Event()
        eleventhEvent.title = "Author Talk: Girls in the World"
        eleventhEvent.time = "1pm"
        eleventhEvent.location = "The Stage | 1pm"
        eleventhEvent.thumbnailImage = Genre.Interactive

        var twelthEvent = Event()
        twelthEvent.title = "Author Talk: Girls in the World"
        twelthEvent.time = "1:30pm"
        twelthEvent.location = "The Gazebo |1:30pm "
        twelthEvent.thumbnailImage = Genre.Interactive

        var thirteenthEvent = Event()
        thirteenthEvent.title = "Storytime with Finn & Michael Buckley"
        thirteenthEvent.time = "1:30pm"
        thirteenthEvent.location = "The Stage | 1:30pm"
        thirteenthEvent.thumbnailImage = Genre.Interactive

        var fourteenthEvent = Event()
        fourteenthEvent.title = "Storytime with Finn & Michael Buckley"
        fourteenthEvent.time = "1:30pm"
        fourteenthEvent.location = "The Stage | 1:30pm"
        fourteenthEvent.thumbnailImage = Genre.Interactive

        var fifteenthEvent = Event()
        fifteenthEvent.title = "Author Talk: Keeping it Real"
        fifteenthEvent.time = "2pm"
        fifteenthEvent.location = "The Stage | 2pm"
        fifteenthEvent.thumbnailImage = Genre.Nonfiction
        var sixteenthEvent = Event()
        sixteenthEvent.title = "Storytime with Joyce Wan"
        sixteenthEvent.time = "2pm"
        sixteenthEvent.location = "The Gazebo | 2pm"
        sixteenthEvent.thumbnailImage = Genre.Interactive

        var seventeenthEvent = Event()
        seventeenthEvent.title = "Storytime with Bryan Collier"
        seventeenthEvent.time = "2:30pm"
        seventeenthEvent.location = "The Gazebo | 2:30pm"
        seventeenthEvent.thumbnailImage = Genre.Interactive


        var ninteenthEvent = Event()
        ninteenthEvent.title = "Author Talk: A WWII Story for All Ages"
        ninteenthEvent.time = "2:45pm"
        ninteenthEvent.location = "The Stage | 2:45pm"
        ninteenthEvent.thumbnailImage = Genre.Interactive

        var twentiethEvent = Event()
        twentiethEvent.title = "Author Talk: The Standardized Tests"
        twentiethEvent.time = "3:15pm"
        twentiethEvent.location = "The Stage | 3:15pm"
        twentiethEvent.thumbnailImage = Genre.Interactive

        var twentyFirstEvent = Event()
        twentyFirstEvent.title = "Last Call For Cash Registers"
        twentyFirstEvent.time = "4:45pm"
        twentyFirstEvent.location = "4:45 pm"
        twentyFirstEvent.thumbnailImage = Genre.Interactive

        
      
        
        return [firstEvent, secondEvent, thirdEvent, fourthEvent, fifthEvent, sixthEvent, seventhEvent, eighthEvent, ninthEvent, tenthEvent, eleventhEvent, twelthEvent, thirteenthEvent, fourteenthEvent, fifteenthEvent, sixteenthEvent, seventeenthEvent,  ninteenthEvent, twentiethEvent, twentyFirstEvent]
    }()
    
    lazy var collectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Color.getColor(.lightGrey)()
        cv.dataSource = self
        cv.delegate = self
        
        
        return cv
    }()
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.setupViews()
        backgroundColor = Color.getColor(.lightGrey)()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", metrics: nil, views: ["v0":collectionView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", metrics: nil, views: ["v0":collectionView]))
        addSubview(collectionView)
        collectionView.register(ScheduleCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(MyHeaderFooterClass.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "Footer")

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScheduleCell
        cell.backgroundColor = Color.getColor(.lightGrey)()
        
       cell.sideLine.backgroundColor = cg.randColor()


        cell.event = events[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
/*
    
    private func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath as IndexPath)
            
            headerView.backgroundColor = UIColor.blue
            return headerView
            
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath as IndexPath)
            
            footerView.backgroundColor = UIColor.green
            return footerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
        
        return
  }
    
    */
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: frame.width, height: 60.0)
    }
    
    
}
class MyHeaderFooterClass: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.purple
}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
}
