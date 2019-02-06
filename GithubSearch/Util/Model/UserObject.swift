//
//  UserObject.swift
//  GithubSearch
//
//  Created by 양어진 on 06/02/2019.
//  Copyright © 2019 양어진. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserObject : Mappable {
    var login : String?
    var public_repos : Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        login <- map["login"]
        public_repos <- map["public_repos"]
    }
    
}
