//
//  MapController.swift
//  CCBF
//
//  Created by Noa on 10/2/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import Foundation
import UIKit

class MapController: UIViewController {
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        //Add and setup scroll view
        self.view.addSubview(self.scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
        
        //Constrain scroll view
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true;
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true;
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true;
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true;
        
        //Add and setup stack view
        self.scrollView.addSubview(self.stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .vertical
        self.stackView.spacing = 10;
        
        //constrain stack view to scroll view
        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true;
        self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 60).isActive = true;
        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true;
        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true;
        
        //constrain width of stack view to width of self.view, NOT scroll view
        self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true;
        
        //add image views to stack view
        let kittenImageView1 = UIImageView(image: UIImage(named: "map"))
        self.stackView.addArrangedSubview(kittenImageView1)
        
        let navView = UINavigationBar(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 50))
        navView.backgroundColor = UIColor.white
        self.view.addSubview(navView)
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(backAction))
        let navItem = UINavigationItem()
        navItem.leftBarButtonItem = button
        navView.items = [navItem]
        
    }
    
    @objc func backAction(){
        dismiss(animated: true, completion: nil)
    }
}
