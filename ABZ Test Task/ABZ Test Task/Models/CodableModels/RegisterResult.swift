//
//  RegisterResult.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/12/25.
//

import Foundation

struct RegisterResult: Codable {
    let success: Bool
    let user_id: Int?
    let message: String
    let fails: Fails?
}

struct Fails: Codable {
    let name: [String]?
    let email: [String]?
    let phone: [String]?
    let position_id: [String]?
    let photo: [String]?
}
