//
//  SplashView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color("PrimaryColor"))
                .ignoresSafeArea()
            Image("Logo")
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SplashView(viewModel: SplashViewModel())
}
