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
        guard let searchURL = queryURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        gettable(searchURL, body: nil, header: header) {
            (res) in
            switch res{
            case .success(let value):
                guard let reposNumber = value.public_repos else{return}
                completion(reposNumber)
            case .error(let error):
                print(error)
            }
        }
    }
}
