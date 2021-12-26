//
//  UserHorizontalController.swift
//  MyRandomUser
//
//  Created by Kamila Lech on 28/11/2021.
//

import Foundation
import UIKit

protocol DidSSelectUserDelegate {
    
    func didSelectUser(user: UserDetail)
}

class UserHorizontalController : HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "UserCellId"
    let topBottomPadding : CGFloat = 12
    let lineSpacing : CGFloat = 10
    
    var users:GrouppedUsers?
    
    var delegate : DidSSelectUserDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .clear
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users?.multiNationUsers?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! UserCell
        let user = users?.multiNationUsers?[indexPath.item]
        cell.nameLabel.text = "\(user?.name?.first ?? "") \(user?.name?.last ?? "")"
        cell.cityLabel.text = user?.location?.city
        cell.dpUrl = user?.picture?.thumbnail
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let user = users?.multiNationUsers?[indexPath.item]{
            delegate?.didSelectUser(user: user)
        }
       
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       // let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 3
        return .init(width: view.frame.width - 32, height: view.frame.height/3 - 18)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 0, bottom: topBottomPadding, right: 0)
    }
    
}
