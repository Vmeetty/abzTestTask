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
                ForEach(Array(viewModel.users.indices), id: \.self) { index in
                    let user = viewModel.users[index]
                    
                    VStack {
                        UserItemRow(user: user)
                        if index == viewModel.users.count - 1 && !viewModel.isLoadingPage {
                            ProgressView()
                                .scaleEffect(1.3)
                                .tint(.black)
                                .onAppear {
                                    viewModel.fetchUsers()
                                }
                                .padding(.bottom)
                        }
                    }
                }
            }
        }
        .onAppear {
            if viewModel.users.isEmpty {
                viewModel.fetchUsers(isInitial: true)
            }
        }
    }
}

#Preview {
    UserListView(viewModel: UserListViewModel(title: "Title", onEvent: { _ in }))
}
