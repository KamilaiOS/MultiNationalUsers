//
//  UserService.swift
//  MyRandomUser
//
//  Created by Akib Quraishi on 27/11/2021.
//

import Foundation

let BASE_URL = "https://randomuser.me/api/?results=10&nat="

enum CountryCode:String {
    case GB = "gb"
    case FI = "fi"
    case US = "us"
    case FR = "fr"
}

class UserService {
    
    var networkService: NetworkService
    
    
    init(networkService:NetworkService){
        self.networkService = networkService
    }

    
    func fetchUsers(countryCode:CountryCode  , completion:@escaping (_ users: [UserDetail]?, _ userError:Error?) -> Void) {
        
        let gbURLstr = BASE_URL + countryCode.rawValue
        
        networkService.fetchRequest(urlString: gbURLstr, httpMethod: .get, json: nil) { (result:Result<UserResult, Error>) in
           
            switch result {
            
            case .failure(let error):
                  completion(nil,error)
                
            case .success(let userResponse):
                
                if let safeUsers = userResponse.results {
                    completion(safeUsers, nil)
                   }
                }
            }
            
    }
    
    
}
