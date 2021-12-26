//
//  UILabel+Ext.swift
//  MyRandomUser
//
//  Created by Akib Quraishi on 27/11/2021.
//

import Foundation


import Foundation
import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines : Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = .white
        self.numberOfLines = numberOfLines
    }
}

extension UIImageView{
    convenience init (cornerRadius: CGFloat){
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        
        
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
    
    
}
