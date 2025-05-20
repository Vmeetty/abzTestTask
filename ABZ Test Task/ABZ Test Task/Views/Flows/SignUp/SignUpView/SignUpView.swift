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
        ZStack {
            BasicView(viewModel: viewModel) {
                Group {
                    CustomTextField(
                        label: "Name",
                        validator: viewModel.validateName(_:),
                        text: $viewModel.username,
                        isValid: $viewModel.isNameValid
                    )
                    .padding(.top)
                    
                    CustomTextField(
                        label: "Email",
                        validator: viewModel.validateEmail(_:),
                        text: $viewModel.email,
                        isValid: $viewModel.isEmailValid,
                        type: .email
                    )
                    
                    CustomTextField(
                        label: "Phone",
                        validator: viewModel.validatePhone(_:),
                        text: $viewModel.phone,
                        isValid: $viewModel.isPhoneValid,
                        type: .phone
                    )
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    if let positions = viewModel.positions {
                        PositionSelectionView(selectedPosition: $viewModel.selectedPosition, positions: positions)
                    }
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
                
                CustomButton(label: "Submit", isEnabled: viewModel.isFormValid) {
                    print("Form submitted!")
                    viewModel.onSubmit()
                }
                .padding(.vertical)
            }
            .onAppear {
                Task {
                    viewModel.onAppear()
                }
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
            
            if viewModel.showResultScreen {
                SignUpResultView(show: $viewModel.showResultScreen, type: viewModel.resultScreenType, message: viewModel.resultMessage)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .hideKeyboardOnTap()
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel(title: "Title", onEvent: { _ in }))
}
