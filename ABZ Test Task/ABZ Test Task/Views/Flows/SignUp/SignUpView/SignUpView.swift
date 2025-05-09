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
            FormView()
            
            VStack(alignment: .leading) {
                PositionSelectionView(selectedPosition: $viewModel.selectedPosition, positions: viewModel.positions)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            CustomTextField(title: "Select photo", value: $viewModel.photo, errorMessage: viewModel.photoError)
                .padding()
            
            Button("Submit") {
                viewModel.submit = true
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel(title: "Title", onEvent: { _ in }))
}
