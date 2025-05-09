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
            Text("User List <-")
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    UserListView(viewModel: UserListViewModel(title: "Title", onEvent: { _ in }))
}
