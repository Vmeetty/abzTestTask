//
//  Screen.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import UIKit

enum Screen: Identifiable, Hashable, Equatable {
    case start
    case reachability
    case home
    case signUp
    case userList
    
    var id: String {
        switch self {
        case .start:
            return "start"
        case .reachability:
            return "reachability"
        case .home:
            return "home"
        case .signUp:
            return "signUp"
        case .userList:
            return "userList"
        }
    }
}
