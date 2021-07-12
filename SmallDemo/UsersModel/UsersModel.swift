//
//  UsersModel.swift
//  SmallDemo
//
//  Created by Amin  on 11/07/2021.
//

import Foundation
import ObjectMapper


struct UsersModel: Mappable {
    
    // MARK: - properties
    var id: Int?
    var name: String?
    var email: String?
    
    // Confirm to mappable protocol
    public init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.id    <- map["id"]
        self.name <- map["name"]
        self.email  <- map["email"]
    }
}
