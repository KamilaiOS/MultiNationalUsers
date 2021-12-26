//
//  UserCell.swift
//  MyRandomUser
//
//  Created by Akib Quraishi on 27/11/2021.
//

import Foundation
import Kingfisher
import UIKit

class UserCell : UICollectionViewCell {
    
    
    
    let imageView = UIImageView(cornerRadius: 8)
   
    let nameLabel = UILabel(text: "", font: .boldSystemFont(ofSize: 18))
    let cityLabel = UILabel(text: "xxx", font: .systemFont(ofSize: 12))
    
    var dpUrl : String? {
        didSet {
            if let imageURL = dpUrl {
                let url = URL(string: imageURL)
                imageView.kf.setImage(with: url)
            }
            
        }
    }
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)

        addSubview(nameLabel)

        let stackView = UIStackView(arrangedSubviews: [imageView, VerticalStackView(arrangedSubviews: [nameLabel, cityLabel], spacing: 8)])
        stackView.spacing = 8
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))

        stackView.alignment = .center
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
