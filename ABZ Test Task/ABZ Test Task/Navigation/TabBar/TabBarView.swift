//
//  TabBarView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import SwiftUI

struct TabBarView: View {
    
    @StateObject private var viewModel = TabBarViewModel()

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $viewModel.selectedTab) {
                UserListCoordinatorView(coordinatorModel: UserListCoordinatorViewModel())
                    .onChange(of: viewModel.showTabBar, { _, newValue in
                        viewModel.showTabBar = newValue
                    })
                    .environmentObject(viewModel)
                    .tag(TabBarModel.userListTab)
                SignUpCoordinatorView(coordinatorModel: SignUpCoordinatorViewModel())
                    .onChange(of: viewModel.showTabBar, { _, newValue in
                        viewModel.showTabBar = newValue
                    })
                    .environmentObject(viewModel)
                    .tag(TabBarModel.signUpTab)
            }
            .navigationBarHidden(true)
            if viewModel.showTabBar {
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $viewModel.selectedTab)
                  
                }
            }
        }
    }
}

#Preview {
    TabBarView()
}
