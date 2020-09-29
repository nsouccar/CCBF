//
//  Sponsor.swift
//  CCBF
//
//  Created by Noa on 9/11/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import Foundation
import UIKit
class SponsorCell:  BaseCell{
  
    
    
    override func setupViews() {
        super.setupViews()
        
        let width = self.frame.width
        let xPos = (width - width)/2
        let label = UILabel(frame: CGRect(x: xPos, y: 30, width: width, height: 100))
        label.text = "A Big Thank You"
        let customFont = UIFont(name: "InstantHarmonyDEMO-Regular", size: 60.0)
        let customFontSmall = UIFont(name: "InstantHarmonyDEMO-Regular", size: 30.0)

        label.font = customFont
        label.textAlignment = .center
        label.textColor = Color.getColor(.blue)()
        let subTitle = UILabel(frame: CGRect(x: xPos, y: 120, width: width, height: 100))
        subTitle.text = "Our sponsors are so generous. Through funds and fun, they help us produce the most amazing children's book festival in the country and deliver on our ambitious mission."
        subTitle.numberOfLines = 5
        subTitle.textColor = .gray
        subTitle.adjustsFontSizeToFitWidth = true
        subTitle.textAlignment = .center
        
        
        addSubview(label)
        addSubview(subTitle)
        
        let textView = UITextView(frame: CGRect(x: xPos, y: 300, width: width, height: 100))
    
        
        let attributedString = NSMutableAttributedString(string: "Learn About Being a Sponsor")
        let url = URL(string: "http://www.ccbfestival.org/be-a-sponsor/")!
        
        // Set the 'click here' substring to be the link
        attributedString.setAttributes([.link: url], range: NSMakeRange(0, 27))
        
        textView.attributedText = attributedString
        textView.font = customFontSmall
        textView.isUserInteractionEnabled = true
        textView.isEditable = false
        textView.textAlignment = .center
        
        
        // Set how links should appear: blue and underlined
        textView.linkTextAttributes = [
            .foregroundColor: Color.getColor(.orange)(),
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
       
       
        var attrs = [
            NSAttributedString.Key.underlineStyle : 1,
            NSAttributedString.Key.foregroundColor : Color.getColor(.orange)()
            ] as [NSAttributedString.Key : Any]
        
        var attributedString2 = NSMutableAttributedString(string:"")
       
        let buttonTitleStr = NSMutableAttributedString(string:"Our 2019 Sponsors", attributes:attrs)
        attributedString2.append(buttonTitleStr)
       
        
        let textView2 = UIButton(frame: CGRect(x: xPos, y: 200, width: width, height: 100))
        textView2.setAttributedTitle(attributedString2, for: .normal)
        textView2.titleLabel?.font = customFontSmall
        textView2.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        addSubview(textView)
        addSubview(textView2)
    }
    
    @objc func buttonClicked(sender: UIButton!) {
        let controller = SponsorViewController()
        self.superview?.findViewController()?.present(controller, animated: true, completion: nil)
    }
    
}
