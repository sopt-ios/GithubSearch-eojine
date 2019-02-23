//
//  APIManager.swift
//  GithubSearch
//
//  Created by 양어진 on 05/02/2019.
//  Copyright © 2019 양어진. All rights reserved.
//

import Foundation

protocol APIManager {}

extension APIManager {
    static func url(_ path: String) -> String {
        return "https://api.github.com" + path
    }
}

struct Token {
    static let accessToken = "token 389a51992c66f60fd3d02e25161728516000756a"
}
