//
//  TabBarCoordinatorView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import SwiftUI

struct TabBarCoordinatorView: View {
    
    @StateObject var coordinatorModel: TabBarCoordinatorViewModel
    var startScreen: Screen
    
    var body: some View {
        NavigationStack(path: $coordinatorModel.path) {
            coordinatorModel.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    coordinatorModel.build(screen)
                }
        }
        .navigationBarBackButtonHidden()
    }
}

