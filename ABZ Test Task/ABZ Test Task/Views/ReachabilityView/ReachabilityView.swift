//
//  ReachabilityView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/13/25.
//

import SwiftUI

struct ReachabilityView: View {
//    @StateObject private var networkMonitor = NetworkMonitor()
    @StateObject var viewModel: ReachabilityViewModel
    
    var body: some View {
        VStack {
            Image("noConnection-image")
//            if networkMonitor.isConnected {
//                CustomButton(label: "Go Next", isEnabled: true) {
//                    viewModel.goNext()
//                }
//                .padding(.vertical)
//            } else {
//                CustomButton(label: "Try again", isEnabled: true) {
//                    networkMonitor.recheck()
//                    
//                }
//                .padding(.vertical)
//            }
        }
        .navigationBarBackButtonHidden()
        .background(Color(.white))
    }
}

#Preview {
    ReachabilityView(viewModel: ReachabilityViewModel(onEvent: { _ in }))
}
