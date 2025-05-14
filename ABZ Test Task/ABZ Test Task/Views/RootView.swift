//
//  RootView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/14/25.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        switch coordinator.route {
        case .splash:
            SplashView()
        case .reachability:
            ReachabilityView()
        case .home:
            TabBarView()
        }
    }
}

#Preview {
    RootView()
}
