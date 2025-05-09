//
//  ErrorResponse.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation

struct ErrorResponse: Decodable {
    let code: Int
    let error: String?
    let messages: [String]
    
    var apiError: APIError {
        .massage(code: messages.first?.description ?? "error")
    }
    
    enum CodingKeys: String, CodingKey {
        case code, messages, error
    }
}
