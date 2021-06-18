//
//  BrowseEndpoint.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import Foundation

enum FlightsEndpoint: EndPoint{
    case search(params: Parameters)
}

extension FlightsEndpoint{
    
    var baseURL: URL{
        return URL(string: Constants.baseURL + "flights")!
    }
    
    var path: String{
        switch self {
        case .search:
            return ""
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .search:
            return .get
        }
    }
    
    var parameters: Parameters?{
        switch self {
        case .search(let params):
            return params
        }
    }
    
    var headers: HTTPHeaders?{
        return nil
    }
    
    var task: Task{
        switch self {
        case .search:
            return .requestParameters
        }
    }
    
    var parametersEncoding: ParametersEncoding?{
        switch self {
        case .search:
            return .url
        }
    }
    
}
