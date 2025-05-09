//
//  SignUpCoordinatorView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI

struct SignUpCoordinatorView: View {
    @StateObject var coordinatorModel: SignUpCoordinatorViewModel
    
    var body: some View {
        NavigationStack(path: $coordinatorModel.path) {
            coordinatorModel.build(.signUp)
                .navigationDestination(for: Screen.self) { screen in
                    coordinatorModel.build(screen)
                }
        }
        .navigationBarBackButtonHidden()
    }
}
