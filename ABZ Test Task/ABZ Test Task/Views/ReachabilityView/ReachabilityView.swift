//
//  ReachabilityView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/13/25.
//

import SwiftUI

struct ReachabilityView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var reachability = ReachabilityService()

    var body: some View {
        VStack {
            Image("noConnection-image")
            
            CustomButton(label: "Try again", isEnabled: true) {
                if reachability.isConnected {
                    coordinator.goTo(.home)
                }
            }
            .padding(.vertical)
        }
        .navigationBarBackButtonHidden()
        .background(Color(.white))
    }
}

#Preview {
    ReachabilityView()
}
