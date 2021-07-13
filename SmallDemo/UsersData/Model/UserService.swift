//
//  UserService.swift
//  SmallDemo
//
//  Created by Amin  on 11/07/2021.
//

import Foundation
import PromiseKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import RxSwift



class UserService {

    
    
    static func getDataUser() -> Promise<[UsersModel]> {
        return Promise { seal in
            
            let url = "https://jsonplaceholder.typicode.com/users"
            
            Alamofire.request(url, method: .get).responseJSON { response in
                
                switch response.result {
                    
                case .failure(let error):
                    seal.reject(error)
                    
                case .success(let users):
                    
                    guard let usersData = Mapper<UsersModel>().mapArray(JSONObject: users) else { return }
                    
                    seal.fulfill(usersData)
                }                
            }
        }
    }
}



