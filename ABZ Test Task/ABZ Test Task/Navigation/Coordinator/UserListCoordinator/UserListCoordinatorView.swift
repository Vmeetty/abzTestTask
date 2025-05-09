//
//  UserListCoordinatorView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import SwiftUI

struct UserListCoordinatorView: View {
    
    @StateObject var coordinatorModel: UserListCoordinatorViewModel
    
    var body: some View {
        NavigationStack(path: $coordinatorModel.path) {
            coordinatorModel.build(.userList)
                .navigationDestination(for: Screen.self) { screen in
                    coordinatorModel.build(screen)
                }
        }
        .navigationBarBackButtonHidden()
    }
}

