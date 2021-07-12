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



class UserService {
    
    static func getUserData(completion: @escaping ([UsersModel]?) -> Void) {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        Alamofire.request(url, method: .get).validate().responseJSON(completionHandler: { (response) in
            
            if let err = response.error {
                print(err.localizedDescription)
            }
            
            switch response.result {
            case .success(let users):
                guard let usersData = Mapper<UsersModel>().mapArray(JSONObject: users) else {
                    print("Error Mapper")
                    return
                }
                print(usersData)
                completion(usersData)
            case .failure(_):
                print("error happen")
            }
        })                
    }
}

