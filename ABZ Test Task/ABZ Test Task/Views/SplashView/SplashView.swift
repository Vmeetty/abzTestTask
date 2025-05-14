//
//  SplashView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI

struct SplashView: View {
//    @StateObject private var networkMonitor = NetworkMonitor()
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color("PrimaryColor"))
                .ignoresSafeArea()
            VStack {
                Image("Logo")
                Button("go") {
                    viewModel.goHome()
                }
            }
        }
//        .navigationBarBackButtonHidden()
//        .onAppear {
//            viewModel.goHome()
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                if networkMonitor.isConnected {
//                    viewModel.goHome()
//                } else {
//                    viewModel.goNoConnection()
//                }
//            }
//        }
    }
}

#Preview {
    SplashView(viewModel: SplashViewModel(title: "", onEvent: { _ in }))
}
