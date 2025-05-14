//
//  UserListView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject var viewModel: UserListViewModel
    
    var body: some View {
        BasicView(viewModel: viewModel) {
            LazyVStack(spacing: 16) {
                ForEach(Array(viewModel.users), id: \.id) { user in
                    UserItemRow(user: user)
                        .onAppear {
                            if user == viewModel.users.last {
                                viewModel.fetchUsers()
                            }
                        }
                }
            }
        }
        .onAppear {
            if viewModel.users.isEmpty {
                viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    UserListView(viewModel: UserListViewModel(title: "Title", onEvent: { _ in }))
}
