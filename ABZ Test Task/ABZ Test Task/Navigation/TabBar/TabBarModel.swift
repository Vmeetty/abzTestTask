//
//  TabBarModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation

enum TabBarModel: String, CaseIterable {
    
    case userListTab
    case signUpTab
    
    var imageValue: String {
        switch self {
        case .userListTab:
            return "person.3.sequence.fill"
        case .signUpTab:
           return "person.crop.circle.fill.badge.plus"
        }
    }
    
    var title: String {
        switch self {
        case .userListTab:
            return "Users"
        case .signUpTab:
            return "Sign up"
        }
    }
}
