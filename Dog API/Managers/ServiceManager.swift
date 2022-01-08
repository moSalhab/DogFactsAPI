//
//  ServiceManager.swift
//  Dog API
//
//  Created by Mohammad Salhab on 07/01/2022.
//

import Foundation
import Alamofire

class ServiceManager {
    
    static let shared = ServiceManager()
    
    private init() {}
    
    internal func request(url:String,
                          method: HTTPMethod = .post,
                          parameters: Parameters? = nil,
                          encoding: URLEncoding = .default,
                          headers: HTTPHeaders? = nil,
                          completion: @escaping (Data?) -> (),
                          failure: @escaping (String?) -> ()) {
        
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: headers)
            .responseJSON { response in
                if (200...299).contains(response.response?.statusCode ?? 0) {
                    print("Status code: \(response.response!.statusCode)")
                    completion(response.data)
                } else {
                    print(response.error?.errorDescription ?? "Something went wrong")
                    failure("Something went wrong!")
                }
            }
    }
}
