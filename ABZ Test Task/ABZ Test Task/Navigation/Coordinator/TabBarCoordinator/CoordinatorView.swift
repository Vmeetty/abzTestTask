//
//  CoordinatorView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject var coordinatorModel: CoordinatorViewModel
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

