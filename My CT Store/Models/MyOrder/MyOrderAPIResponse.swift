//
//  MyOrderAPIResponse.swift
//  My CT Store
//
//  Created by Arpit Thummar on 10/04/23.
//

import Foundation

struct MyOrderAPIResponse: Decodable {
    var error: Bool
    var APIData: [OrderAPIData]
    
    enum CodindKeys: String, CodingKey {
        case error
        case APIData = "data"
    }
}
