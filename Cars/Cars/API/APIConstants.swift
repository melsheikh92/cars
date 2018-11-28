//
//  APIConstants.swift
//  Cars
//
//  Created by Msheikh on 11/28/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import Moya
enum CarsAPI{
    case cars
}

extension CarsAPI:Moya.TargetType{
    
    public var baseURL: URL {
        return URL(string: "http://api.emiratesauction.com/v2/")!
    }
    
    public var path: String {
        switch self {
        case .cars:
            return "carsonline"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return "Test data".data(using: .utf8)!
    }
    
    public var task: Moya.Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
}
