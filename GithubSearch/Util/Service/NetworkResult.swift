//
//  NetworkResult.swift
//  GithubSearch
//
//  Created by 양어진 on 05/02/2019.
//  Copyright © 2019 양어진. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case error(Error)
}
