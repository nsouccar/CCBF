//
//  Extensions.swift
//  CCBF
//
//  Created by Noa on 7/11/19.
//  Copyright © 2019 Noa Souccar. All rights reserved.
//

import UIKit

extension UIImage {
    func toString() -> String? {
        let data: Data? = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}

extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data)
        }
        return nil
    }
}

extension UIImageView {
    func dowloadFromServer(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func dowloadFromServer(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        dowloadFromServer(url: url, contentMode: mode)
    }
}

extension UIColor {
    static func rgb(red: CGFloat, blue: CGFloat, green:CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

enum Color {
 case blue, orange, purple, red, grey,lightGrey, otherBlue
    
    func getColor() -> UIColor {
    
    switch self {
    case .orange: return UIColor.rgb(red: 249, blue: 79, green: 164, alpha: 1.0)
    case .blue:  return UIColor.rgb(red: 2, blue: 170, green: 196, alpha: 1) 
    case .purple: return UIColor.rgb(red: 138, blue: 226, green: 43, alpha: 0.8)
    case .red: return UIColor.rgb(red: 206, blue: 85, green: 101, alpha: 0.8)
    case .grey: return UIColor.rgb(red: 118, blue: 120, green: 118, alpha: 0.8)
    case .lightGrey: return UIColor.rgb(red: 118, blue: 120, green: 118, alpha: 0.1)
    case .otherBlue: return UIColor.rgb(red: 19, blue:192 , green: 175, alpha: 1.0)
        }
    }
    
   
}

enum Genre: String {
    
    case Fiction = "Fiction"
    case Nonfiction = "Nonfiction"
    case Kids = "Kids"
    case Poetry = "Poetry"
    case Interactive = "Interactive"
    case Music = "Music"
    
}

class CustomButton {
    static func addDashedBottomBorder(to button : UIButton) {
        
        let color = UIColor.black.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = button.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: 0)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2.0
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.masksToBounds = false
        shapeLayer.lineDashPattern = [2,2]
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: shapeRect.height, width: shapeRect.width, height: 0), cornerRadius: 0).cgPath
        
        button.layer.addSublayer(shapeLayer)
    }
    
    
}

class ColorGenerator {
    var i = 0
    
    func randColor() -> UIColor {
        var color: UIColor
        let Colors: [Color] = [.orange, .blue, .red, .purple]
        if i > 3 {
            i = 0
            color = Color.getColor(Colors[i])()
        } else {
            color = Color.getColor(Colors[i])()
        }
        i += 1
        return color
    }
    
    func randColor2() -> UIColor {
        var color: UIColor
        let Colors: [Color] = [.orange,.orange, .orange, .orange,  .blue, .blue, .blue,.blue,  .red, .red,  .red, .red,  .purple, .purple, .purple, .purple]
        if i > 15 {
            i = 0
            color = Color.getColor(Colors[i])()
        } else {
            color = Color.getColor(Colors[i])()
        }
        i += 1
        return color
    }
}

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}

class BaseEventCell: UICollectionViewCell {
    var event: Event?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews(){}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



