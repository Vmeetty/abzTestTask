//
//  SignUpView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel: SignUpViewModel
    
    var body: some View {
        BasicView(viewModel: viewModel) {
            Text("Sign Up View <-")
        }
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel(title: "Title", onEvent: { _ in }))
}
