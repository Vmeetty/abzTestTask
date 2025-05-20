//
//  LoadingView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI

struct LoadingView: View {
    
    @Binding var isLoading: Bool
    var alignment: Alignment = .center
    var scaleEffect: CGFloat = 2
    
    var body: some View {
        if isLoading {
            ProgressView()
                .frame(width: 16, height: 16)
                .ignoresSafeArea()
                .scaleEffect(scaleEffect)
                .tint(Color("StrongGrayColor"))
                .progressViewStyle(.circular)
        }
    }
}

#Preview {
    LoadingView(isLoading: .constant(true))
}
