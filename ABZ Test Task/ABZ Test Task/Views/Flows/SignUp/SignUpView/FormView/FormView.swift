//
//  FormView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/10/25.
//

import SwiftUI

struct FormView: View {
    
    @StateObject private var viewModel = FormViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CustomTextField(title: "Your name", value: $viewModel.name, errorMessage: viewModel.nameError)
                CustomTextField(title: "Email", value: $viewModel.email, errorMessage: viewModel.emailError)
                CustomTextField(title: "Phone", value: $viewModel.phone, errorMessage: viewModel.phoneError)
            }
            .padding()
        }
    }
}

#Preview {
    FormView()
}
