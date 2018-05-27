//
//  FoodApi.swift
//  MediaTarget-Food
//
//  Created by Максим Кудрявцев on 25.05.2018.
//  Copyright © 2018 horoko. All rights reserved.
//

import Foundation
import Moya
import Result

let FoodProvider = MoyaProvider<FoodApi>(plugins: [NetworkLoggerPlugin(verbose: true), AIPlugin()])

public enum FoodApi {
    case search(query: String, page: Int)
    case recipe(id: String)
    
    static let apiKey = "f932673ac292dd924db95045bfb3589f"
}

extension FoodApi: TargetType {
    public var baseURL: URL { return URL(string: "http://food2fork.com/api/")! }
    
    public var path: String {
        switch self {
        case .search:
            return "search"
        case .recipe:
            return "get"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Task {
        switch self {
        case .search(let query, let page):
            return .requestParameters(parameters: ["key": FoodApi.apiKey, "q": query, "page": page], encoding: URLEncoding.default)
        case .recipe(let id):
            return .requestParameters(parameters: ["key": FoodApi.apiKey, "rID": id], encoding: URLEncoding.default)
        }
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
}
