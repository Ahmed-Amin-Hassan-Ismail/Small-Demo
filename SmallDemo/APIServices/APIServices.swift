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
    
    static func APIService<T: Mappable>(url: String, method: HTTPMethod, classResponse: T.Type) -> Promise<T> {
        return Promise<T> { seal in
            
            // Calling Network
            Alamofire
                .request(url, method: method)
                .validate()
                .responseObject { (response: DataResponse<T>) in
                    
                    // Checking for errors
                    if let error = response.error {
                        seal.reject(error)
                        print(error.localizedDescription)
                        return
                    }
                    
                    // Successful Calling
                    if let value = response.result.value {
                        seal.fulfill(value)
                        print(value)
                    }
                }
        }
    }
}
