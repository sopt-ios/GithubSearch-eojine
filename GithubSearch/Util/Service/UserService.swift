//
//  UserService.swift
//  GithubSearch
//
//  Created by 양어진 on 06/02/2019.
//  Copyright © 2019 양어진. All rights reserved.
//

import Foundation
import Alamofire

struct UserService: APIManager, Requestable{
    typealias NetworkData = UserObject
    
    static let shared = UserService()
    var searchURL = url("/users")
    let header: HTTPHeaders = [
        "Authorization" : ""
    ]
    
    
    
    func getUserRepoNumResult(userName: String, completion: @escaping (Int) -> Void) {
        let queryURL = searchURL + "/\(userName)"
        
        print("userName : \(userName)")
        guard let searchURL = queryURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        gettable(searchURL, body: nil, header: header) {
            (res) in
            print("res : ", res)
            switch res{
            case .success(let value):
                print("value : \(value)")
                guard let reposNumber = value.public_repos else{return}
                print("reposNumber : \(reposNumber)")
                completion(reposNumber)
            case .error(let error):
                print("byebyebyebye")
                print(error)
            }
        }
    }
}
