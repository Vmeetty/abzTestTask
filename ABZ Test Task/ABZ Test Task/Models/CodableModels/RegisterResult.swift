//
//  RegisterResult.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/12/25.
//

import Foundation

struct RegisterResult: Codable {
    let success: Bool
    let user_id: Int
    let message: String
}
