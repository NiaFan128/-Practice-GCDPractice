//
//  API.swift
//  GCDPractice
//
//  Created by 乃方 on 2018/8/31.
//  Copyright © 2018年 Nia. All rights reserved.
//

import Foundation

class API {
    
    typealias Name = (String?, Error?) -> Void
    
    func getNameAPI(completionHandler completion: @escaping Name) {
        
        guard let url = URL(string: "https://stations-98a59.firebaseio.com/name.json") else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
                
                if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                    
                    guard let returnData = String(data: data, encoding: .utf8) else {
                        return
                    }
                    
                    completion(returnData, nil)
                    print(returnData)
                    
                }
            }
        })
        
        task.resume()
        
    }
    
    func getAddressAPI(completionHandler completion: @escaping Name) {
        
        guard let url = URL(string: "https://stations-98a59.firebaseio.com/address.json") else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
                
                if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                    
                    guard let returnData = String(data: data, encoding: .utf8) else {
                        return
                    }
                    
                    completion(returnData, nil)
                    print(returnData)
                    
                }
            }
        })
        
        task.resume()
        
    }

    func getHeadAPI(completionHandler completion: @escaping Name) {
        
        guard let url = URL(string: "https://stations-98a59.firebaseio.com/head.json") else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            
            DispatchQueue.main.async {

                guard let data = data, error == nil else {
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
            
                if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                
                    guard let returnData = String(data: data, encoding: .utf8) else {
                        return
                    }
                
                    completion(returnData, nil)
                    print(returnData)
                
                }
            }
        })
        
        task.resume()
        
    }
    
}

//enum APIUrl: String {
//
//    case school = "https://stations-98a59.firebaseio.com/name.json"
//    case address = "https://stations-98a59.firebaseio.com/address.json"
//    case head = "https://stations-98a59.firebaseio.com/head.json"
//}
//
//class API {
//
//    func getAPI(api: APIUrl) {
//
//        guard let url = URL(string: api.rawValue) else {
//            return
//        }
//
//        print(url)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            guard let data = data, error == nil else {
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse else {
//                return
//            }
//
//            if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
//
//                let returnData = String(data: data, encoding: .utf8)
//
//                switch api {
//                case .school: = returnData
//                case .address: = returnData
//                case .head: = returnData
//                default: break
//                }
//
//                print(returnData ?? "")
//
//            }
//
//        }.resume()
//
//    }
//
//}
