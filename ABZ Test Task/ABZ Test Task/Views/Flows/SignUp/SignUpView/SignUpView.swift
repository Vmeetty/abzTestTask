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
                    supportingText: "Format: +380 (XX) XXX - XX - XX",
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
            
            PhotoUploadField(
                label: "Upload your photo",
                errorText: viewModel.photoErrorText,
                isValid: viewModel.isPhotoValid,
                hasPhoto: viewModel.selectedPhoto != nil,
                onUpload: viewModel.pickPhoto,
                onRemove: viewModel.removePhoto
            )
            .padding(.horizontal)
            
            if let image = viewModel.selectedPhoto {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Button("Submit") {
                print("Form submitted!")
                viewModel.onSubmit()
            }
            .disabled(!viewModel.isFormValid)
        }
        .onAppear {
            viewModel.onAppear()
        }
        .confirmationDialog("Choose how you want to add a photo", isPresented: $viewModel.showPhotoSourceSheet, titleVisibility: .visible) {
            Button("Camera") {
                viewModel.selectSource(.camera)
            }
            Button("Gallery") {
                viewModel.selectSource(.photoLibrary)
            }
            Button("Cancel", role: .cancel) {}
        }
        .fullScreenCover(isPresented: $viewModel.isPhotoPickerPresented) {
            PhotoPicker(selectedImage: $viewModel.selectedPhoto, sourceType: viewModel.photoSource)
        }
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel(title: "Title", onEvent: { _ in }))
}
