//
//  SearchService.swift
//  GithubSearch
//
//  Created by 양어진 on 06/02/2019.
//  Copyright © 2019 양어진. All rights reserved.
//

import Foundation
import Alamofire

struct SearchService: APIManager, Requestable{
    typealias NetworkData = SearchObject
    static let shared = SearchService()
    var searchURL = url("/search/users")
    let header: HTTPHeaders = [
        "Authorization" : Token.accessToken
    ]
    
    func getSearchAllResult(tag: String, completion: @escaping (Int) -> Void) {
        let queryURL = searchURL + "?q=\(tag)"
        guard let searchURL = queryURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        getRequest(searchURL, body: nil, header: header) {
            (res) in
            switch res{
            case .success(let value):
                guard let totalCount = value.total_count else{return}
                completion(totalCount)
            case .error(let error):
                print(error)
            }
        }
    }
    
    func getSearchResult(tag: String, perPage: Int, completion: @escaping ([SearchItem]) -> Void) {
        let queryURL = searchURL + "?q=\(tag)&page=1&per_page=\(perPage)"
        guard let searchURL = queryURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        getRequest(searchURL, body: nil, header: header) {
            (res) in
            switch res{
            case .success(let value):
                guard let searchData = value.items else{return}
                completion(searchData)
            case .error(let error):
                print(error)
            }
        }
    }
}
