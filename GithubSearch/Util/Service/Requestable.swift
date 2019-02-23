//
//  Requestable.swift
//  GithubSearch
//
//  Created by 양어진 on 06/02/2019.
//  Copyright © 2019 양어진. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol Requestable {
    associatedtype NetworkData: Mappable
}

extension Requestable {
    
    //서버에 get 요청을 보내는 함수
    func getRequest(_ url: String, body: [String:Any]?, header: HTTPHeaders?, completion: @escaping (NetworkResult<NetworkData>) -> Void) {
        Alamofire.request(url, method: .get, parameters: body, encoding: JSONEncoding.default, headers: header).responseObject { (res: DataResponse<NetworkData>) in
            
            switch res.result {
            case .success:
                guard let value = res.result.value else { return }
                completion(.success(value))
            case .failure(let err):
                completion(.error(err))
            }
        }
    }
}
