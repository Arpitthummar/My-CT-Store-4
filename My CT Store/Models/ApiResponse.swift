//
//  ApiResponse.swift
//  My CT Store
//
//  Created by Arpit Thummaer on 31/03/23.
//

import Foundation

struct ApiResponse: Decodable {
    var error: Bool
    var data: [Area]
}
