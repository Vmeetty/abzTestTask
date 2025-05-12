//
//  SignUpViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI
import Combine

class SignUpViewModel: BasicViewModel {
    
    // MARK: - Wrapped Properties
    @Published var positions: Positions = []
    @Published var selectedPosition: Position? = nil
    
    @Published var username = ""
    @Published var email = ""
    @Published var phone = ""
    
    @Published var isNameValid = false
    @Published var isEmailValid = false
    @Published var isPhoneValid = false
    
    @Published var selectedPhoto: UIImage? = nil
    @Published var isPhotoPickerPresented = false
    @Published var showPhotoSourceSheet = false
    @Published var photoSource: PhotoPicker.SourceType = .photoLibrary
    
    // MARK: - Properties
    private var subscriptions = Set<AnyCancellable>()
    
    var isPhotoValid: Bool {
        selectedPhoto != nil
    }
    
    var photoErrorText: String? {
        isPhotoValid ? nil : "Photo is required"
    }
    
    var isFormValid: Bool {
        isNameValid && isEmailValid && isPhoneValid && selectedPosition != nil && isPhotoValid
    }
    
    // MARK: - Public funcs
    func onAppear() {
        getPostionList()
    }
    
    func validateName(_ text: String) -> String? {
        text.isValidName ? nil : "Name must be at least 2 letters, no symbols"
    }

    func validateEmail(_ text: String) -> String? {
        text.isValidEmail ? nil : "Invalid email"
    }

    func validatePhone(_ text: String) -> String? {
        text.isValidPhone ? nil : "Format: +38 (XXX) XXX - XX - XX"
    }
    
    func pickPhoto() {
        showPhotoSourceSheet = true
    }
    
    func selectSource(_ source: PhotoPicker.SourceType) {
        photoSource = source
        isPhotoPickerPresented = true
    }
    
    func removePhoto() {
        selectedPhoto = nil
    }
    
    // MARK: - Private funcs
    private func getPostionList() {
        isLoading = true
        APIClient.userListClient.getPosition()
            .sink { [weak self] in
                guard let self else { return }

                switch $0 {
                case .failure(let error):
                    self.errorText = error.localizedDescription
                    self.showingError = true
                case .finished:
                    break
                }
            } receiveValue: { [weak self] data in
                guard let self else { return }
                DispatchQueue.main.async {
                    self.positions = data.positions
                }
            }
            .store(in: &subscriptions)

    }
    
}
