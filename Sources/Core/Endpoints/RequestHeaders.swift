//
//  RequestHeaders.swift
//  SnapsureSDK
//
//  Created by Artem Novichkov on 10/03/2017.
//  Copyright © 2016 Rosberry. All rights reserved.
//

enum RequestHeaders {
    
    case authorization(String)
    case multipartData
    
    var key: String {
        switch self {
        case .authorization: return "Authorization"
        case .multipartData: return "Content-Type"
        }
    }
    
    var value: String {
        switch self {
        case .authorization(let token): return "Bearer \(token)"
        case .multipartData(let token): return "multipart/form-data"
        }
    }
}
