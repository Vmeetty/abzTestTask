//
//  TabBarCoordinatorViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import SwiftUI

class TabBarCoordinatorViewModel: CoordinatorModel {
    
    override init() {}
    
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .userList:
            UserListView(viewModel: UserListViewModel(title: "Working with GET request", onEvent: { event in
                switch event {
                case .goNext:
                    print("Go Next")
                default:
                    break
                }
            }))
        case .signUp:
            SignUpView(viewModel: SignUpViewModel(title: "Working with POST request", onEvent: { event in
                switch event {
                case .goNext:
                    print("Go Next")
                default:
                    break
                }
            }))
        default:
            EmptyView()
        }
    }
    
}
