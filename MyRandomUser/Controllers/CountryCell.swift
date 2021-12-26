//
//  CountryCell.swift
//  MyRandomUser
//
//  Created by Kamila Lech on 27/11/2021.
//

import Foundation
import UIKit

class CountryCell : UICollectionViewCell {
   
    let nameLabel = UILabel(text: "COUNTRY CODE", font: .boldSystemFont(ofSize: 25))
    
    let horizontalController = UserHorizontalController()
    
    
    
    override init(frame: CGRect) {
       super.init(frame : frame)
        
        addSubview(nameLabel)
        nameLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))

        addSubview(horizontalController.view)
       
        horizontalController.view.anchor(top: nameLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
 }

