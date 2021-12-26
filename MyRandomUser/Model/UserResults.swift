//
//  Model.swift
//  MyRandomUser
//
//  Created by Akib Quraishi on 26/11/2021.
//

import Foundation

struct UserResult : Codable {
    var results: [UserDetail]?
}

struct UserDetail : Codable {
    var gender : String?
    var name : Name?
    var location : Location?
    var email : String?
    var login : Login?
    var dob : Dob?
    var registered : Reg?
    var phone : String?
    var cell : String?
    var id : Id?
    var picture : Pic?
    var nat : String?
}
 
struct Name : Codable {
    var title : String?
    var first : String?
    var last : String?
}

struct Location : Codable {
    var street : Street?
    var city : String?
    var state : String?
    var country : String?
    //var postcode : String?
    var coordinates : Coordinates?
    var timezone : Timezone?
}

struct Street : Codable {
    var number : Int?
    var name : String?
    
}

struct Coordinates : Codable {
    var latitude : String?
    var longitude : String?
}

struct Timezone : Codable {
    var offset : String?
    var description : String?
}

struct Login : Codable {
    var uuid : String?
    var username : String?
    var password : String?
    var salt : String?
    var md5 : String?
    var sha1 : String?
    var sga256 : String?
}

struct Dob : Codable {
    var date : String?
    var age : Int?
}

struct Reg : Codable {
    var date : String?
    var age : Int?
}

struct Id : Codable {
    var name : String?
    var value : String?
}

struct Pic : Codable {
    var large : String?
    var medium : String?
    var thumbnail : String?
}


struct GrouppedUsers {
    var countryName:String?
    var multiNationUsers:[UserDetail]?
}
