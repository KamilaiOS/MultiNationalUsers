//
//  ViewController.swift
//  MyRandomUser
//
//  Created by Akib Quraishi on 26/11/2021.
//

import UIKit

class MainController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    var cellId = "cellId"
    var countryCell = "countryCell"
    let headerId = "headerID"
   

    var grouppedUsers = [GrouppedUsers]()
    
    var userCollectionView : UICollectionView?
    
    let dispatchGroup = DispatchGroup()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.setGradientBackground(colorOne: UIColor.hexStringToUIColor(hex: "#8E2DE2"), colorTwo: .hexStringToUIColor(hex: "#4A00E0"))
        
        setupCollectionView()
        
        fetchMultiNationUsers()
        
    }
    
    fileprivate func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        userCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        userCollectionView?.register(CountryCell.self, forCellWithReuseIdentifier: countryCell)
        
        userCollectionView?.isScrollEnabled = true
        userCollectionView?.backgroundColor = .clear
        userCollectionView?.delegate = self
        userCollectionView?.dataSource = self
        
        if let userCollectionView = userCollectionView {
            view.addSubview(userCollectionView)
        }
    }
  
    fileprivate func fetchMultiNationUsers() {
        
        let networkService = NetworkService()
        
        let userService = UserService(networkService: networkService)
        
        dispatchGroup.enter()
        
        userService.fetchUsers(countryCode: .GB) { users, userError in
            self.dispatchGroup.leave()
            
            if let userError = userError {
                print("GB Error: \(userError.localizedDescription)")
            }
            
            guard let gbUsers = users else { return }
            
            let gbGroup = GrouppedUsers(countryName: "United Kingdom", multiNationUsers: gbUsers)
            
            self.grouppedUsers.append(gbGroup)
            
        }
        
        dispatchGroup.enter()
        
        userService.fetchUsers(countryCode: .FI) { [self] users, userError in
           
            self.dispatchGroup.leave()
            
            if let userError = userError {
                print("FI Error: \(userError.localizedDescription)")
            }
            
            guard let fiUsers = users else { return }
            
            let fiGroup = GrouppedUsers(countryName: "Finland", multiNationUsers: fiUsers)
            
            self.grouppedUsers.append(fiGroup)
            
        }
        
        dispatchGroup.enter()
       
        userService.fetchUsers(countryCode: .US) { users, userError in
           
            self.dispatchGroup.leave()
            
            if let userError = userError {
                print("US Error: \(userError.localizedDescription)")
            }
            
            guard let usUsers = users else { return }
            
            let usGroup = GrouppedUsers(countryName: "United States of America", multiNationUsers: usUsers)
            
            self.grouppedUsers.append(usGroup)
            
        }
        
        
        
        dispatchGroup.notify(queue: .main) {
           // print("Dispach Gropus Completed: \(self.grouppedUsers.count ?? 0)")
           self.userCollectionView?.reloadData()
        }
        
        
        
    }
    
    
}



extension MainController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return grouppedUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: countryCell, for: indexPath) as! CountryCell
        cell.nameLabel.text = grouppedUsers[indexPath.item].countryName
        cell.horizontalController.users = grouppedUsers[indexPath.item]
        cell.horizontalController.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    
}


extension MainController: DidSSelectUserDelegate {
    func didSelectUser(user: UserDetail) {
        print(user)
    }
    
    
}
