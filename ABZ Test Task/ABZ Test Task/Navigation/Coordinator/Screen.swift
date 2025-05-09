//
//  Screen.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import UIKit

enum Screen: Identifiable, Hashable, Equatable {
    case signUp
    case userList
    
    var id: String {
        switch self {
        case .signUp:
            return "signUp"
        case .userList:
            return "userList"
        }
    }
}
