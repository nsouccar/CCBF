//
//  EventCells.swift
//  CCBF
//
//  Created by Noa on 9/10/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import Foundation
import UIKit

class TitleCell: BaseEventCell {
    var eventTitle: String?
    var eventTime: String?
    
    override var event: Event? {
        didSet {
            eventNameLabel.text = event?.title
            genreLabel.text     = event?.thumbnailImage?.rawValue
            eventTitle          = event?.title
            eventTime           = event?.time
            
        }
    }
    
   
    


    
    
    let backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 150))
        //view.backgroundColor = Color.getColor(.blue)()
        return view
        
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 60, width: 375, height: 30))
        label.textColor = Color.getColor(.grey)()
        return label
        
        
    }()
    
    let shareView: UIButton = {
        let view = UIButton(frame: CGRect(x: 0, y: 100, width: 375, height: 50))
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
        let mb = ShareBar()
        mb.backgroundColor = UIColor.white
        mb.translatesAutoresizingMaskIntoConstraints = false
       
        //let guide = view.safeAreaLayoutGuide
        //mb.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        view.addSubview(mb)
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", metrics: nil, views: ["v0":mb]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|",  metrics: nil, views: ["v0":mb]))
        return view
        
    }()
    
    
    
    let eventNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 375, height: 30))
        label.textColor = UIColor.gray
        return label
        
    }()
    
    
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(backView)
        backView.addSubview(eventNameLabel)
        backView.addSubview(genreLabel)
        backView.addSubview(shareView)
        

        shareView.addTarget(self, action: #selector(activity), for: .touchUpInside)
        
        
        
    }
    
    @objc func activity() {
        let shareableString = "Catch \(eventTitle) at the Chappaqua Book Festival from \(eventTime)!"
        let ac = UIActivityViewController(activityItems: [shareableString], applicationActivities: nil)
        self.superview?.findViewController()?.present(ac, animated: true, completion: nil)
    }
    
    
    
}

class DateandLocation: BaseEventCell {
    override var event: Event? {
        didSet {
            timeLabel.text = event?.time
            locationLabel.text = event?.location
        }
    }
    
    let backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 150))
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.0)
        return view
        
    }()
    
    let backViewfilter: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 150))
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        return view
        
    }()
    
    let lineView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 150, width: 375, height: 1))
        view.backgroundColor = Color.getColor(.lightGrey)()
        return view
        
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 50, width: 70, height: 70))
        label.text = "time"
        label.textColor = UIColor.black
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        label.text = "location"
        label.textColor = UIColor.black
        
        return label
        
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(backView)
        backView.addSubview(backViewfilter)
        backView.addSubview(timeLabel)
        backView.addSubview(locationLabel)
        backView.addSubview(lineView)
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-65-[v0(70)]", metrics: nil, views: ["v0":locationLabel]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(60)]", metrics: nil, views: ["v0":locationLabel]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-65-[v0(70)]", metrics: nil, views: ["v0":timeLabel]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-70-[v0(60)]", metrics: nil, views: ["v0":timeLabel]))
        }
    }



class Presenters: BaseEventCell {
    
    let backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 150))
        view.backgroundColor = Color.getColor(.blue)()
        return view
        
    }()
    
    let backViewfilter: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 150))
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.75)
        return view
        
    }()
    
    let lineView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 150, width: 375, height: 1))
        view.backgroundColor = Color.getColor(.lightGrey)()
        return view
        
    }()
    
   
   
    override func setupViews() {
        super.setupViews()
        let presenterName = UILabel( frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        presenterName.text = "YOLANDA"
        addSubview(backView)
        backView.addSubview(backViewfilter)
       backView.addSubview(presenterName)
        
        
        
    }
}

class GenresandBlurb: BaseEventCell {
    
    let lineView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 150, width: 375, height: 1))
        view.backgroundColor = Color.getColor(.lightGrey)()
        return view
        
    }()
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.blue
        let genreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        genreLabel.text = "hello"
        let blurb = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        blurb.text = "hello"
        addSubview(genreLabel)
        addSubview(blurb)
        addSubview(lineView)
    }
    
}
