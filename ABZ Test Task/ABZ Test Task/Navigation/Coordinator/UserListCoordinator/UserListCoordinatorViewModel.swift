//
//  UserListCoordinatorViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import SwiftUI

class UserListCoordinatorViewModel: CoordinatorModel {
    
    override init() {}
    
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .userList:
            UserListView()
        default:
            EmptyView()
        }
    }
    
}
