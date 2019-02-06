//
//  SearchItem.swift
//  GithubSearch
//
//  Created by 양어진 on 06/02/2019.
//  Copyright © 2019 양어진. All rights reserved.
//

import Foundation
import ObjectMapper

struct SearchItem : Mappable {
    var login : String?
    var avatar_url : String?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        login <- map["login"]
        avatar_url <- map["avatar_url"]

    }
    
}
