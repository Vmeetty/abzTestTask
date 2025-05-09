//
//  Authorization.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation

// MARK: - Authorization
struct Authorization: Codable {
    let expiration: Int?
    let accessToken: String
    let refreshToken: String?
    let userId: String?
}
