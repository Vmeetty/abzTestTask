//
//  StartCoordinatorView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/13/25.
//

import SwiftUI

struct StartCoordinatorView: View {
    
    @StateObject var coordinatorModel: StartCoordinatorViewModel
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
