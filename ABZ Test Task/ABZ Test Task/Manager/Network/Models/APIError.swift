//
//  APIError.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation

enum APIError: LocalizedError {

    case `default`(code: String = "Server is not available")
    case unathorized
    case massage(code: String)

    var errorDescription: String? {
        switch self {
        case .default(let code):
            return (APIErrorCode(rawValue: code) ?? .default).localizedMessage
        case .unathorized:
            return "Unathorized"
        case .massage(let error):
            return error.description
        }
    }
}
