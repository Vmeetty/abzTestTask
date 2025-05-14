//
//  SplashView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//
import SwiftUI

struct SplashView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var reachability = ReachabilityService()

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color("PrimaryColor"))
                .ignoresSafeArea()
            Image("Logo")
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if reachability.isConnected {
                    coordinator.goTo(.home)
                } else {
                    coordinator.goTo(.reachability)
                }
            }
        }
    }
}


#Preview {
    SplashView()
}
