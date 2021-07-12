//
//  APIServices.swift
//  SmallDemo
//
//  Created by Amin  on 11/07/2021.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import PromiseKit


class APIServices {
    
    static func APIService<T: Mappable>(url: URL, method: HTTPMethod, classResponse: T.Type) -> Promise<[T]> {
        return Promise<[T]> { seal in
            
            // Calling Network
            Alamofire.request(url, method: method).responseJSON { response in
                
                // Handling Result
                switch response.result {
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    seal.reject(error)
                    
                case .success(let users):
                    guard let usersData = Mapper<T>().mapArray(JSONObject: users) else {
                        print("Error Whereas mapping data")
                        return
                    }
                    seal.fulfill(usersData)
                    print(usersData)
                            
                }
            }
        }
    }
}
