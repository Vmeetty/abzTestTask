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
            Group {
                CustomTextField(
                    label: "Name",
                    supportingText: "Enter your name",
                    validator: viewModel.validateName(_:),
                    text: $viewModel.username,
                    isValid: $viewModel.isNameValid
                )
                
                CustomTextField(
                    label: "Email",
                    supportingText: "Enter your email",
                    validator: viewModel.validateEmail(_:),
                    text: $viewModel.email,
                    isValid: $viewModel.isEmailValid
                )
                
                CustomTextField(
                    label: "Phone",
                    supportingText: "Format: +38 (XXX) XXX - XX - XX",
                    validator: viewModel.validatePhone(_:),
                    text: $viewModel.phone,
                    isValid: $viewModel.isPhoneValid
                )
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                PositionSelectionView(selectedPosition: $viewModel.selectedPosition, positions: viewModel.positions)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Button("Submit") {
                print("Form submitted!")
            }
            .disabled(!viewModel.isFormValid)
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel(title: "Title", onEvent: { _ in }))
}
