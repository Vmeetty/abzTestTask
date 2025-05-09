//
//  SignUpCoordinatorViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI

class SignUpCoordinatorViewModel: CoordinatorModel {
    override init() {}
    
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .signUp:
            SignUpView()
        default:
            EmptyView()
        }
    }
}
