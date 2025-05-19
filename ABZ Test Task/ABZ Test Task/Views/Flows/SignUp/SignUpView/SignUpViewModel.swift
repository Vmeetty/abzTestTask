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
    @Published var positions: Positions?
    @Published var selectedPosition: Position?
    
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
    @Published var photoErrorText: String? = nil
    
    @Published var showResultScreen = false
    @Published var resultScreenType: SignUpResultScreenType = .none
    @Published var resultMessage: String = ""
    
    // MARK: - Properties
    private var subscriptions = Set<AnyCancellable>()
    
    var isPhotoValid: Bool {
        selectedPhoto != nil && photoErrorText == nil
    }
    
//    var photoErrorText: String? {
//        isPhotoValid ? nil : "Photo is required"
//    }
    
    var isFormValid: Bool {
        isNameValid && isEmailValid && isPhoneValid && selectedPosition != nil && isPhotoValid
    }
    
    // MARK: - Public funcs
    func onAppear() {
        getPostionList()
    }
    
    func onSubmit() {
        registerUser()
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
                    self.isLoading = false
                case .finished:
                    break
                }
            } receiveValue: { [weak self] data in
                guard let self else { return }
                
                DispatchQueue.main.async {
                    self.positions = data.positions
                    self.isLoading = false
                }
            }
            .store(in: &subscriptions)

    }
    
    private func registerUser() {
        isLoading = true
        guard let image = selectedPhoto else {
            errorText = "Failed to load user image"
            showingError = true
            isLoading = false
            return
        }
        
        guard image.size.width >= 70, image.size.height >= 70 else {
            photoErrorText = "Image must be at least 70x70 pixels"
            showingError = true
            isLoading = false
            return
        }
        
        guard let imageData = image.jpegData(compressionQuality: 0.9) else {
            photoErrorText = "Photo must be in JPEG format"
            showingError = true
            isLoading = false
            return
        }
        
        let maxBytes = 5 * 1024 * 1024
        guard imageData.count <= maxBytes else {
            photoErrorText = "Photo must not exceed 5 MB"
            showingError = true
            isLoading = false
            return
        }
        
        guard let positionId = selectedPosition?.id else {
            photoErrorText = "Please select a position"
            showingError = true
            isLoading = false
            return
        }
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            return
        }
        
        guard let positionId = selectedPosition?.id else {
            return
        }
        
        let userData = UserData(name: username, email: email.lowercased(), phone: phone.digitsOnly, position_id: positionId)
        let uploadData = UploadDataWithFile(userData: userData, imageName: "userPhoto", imageData: imageData)
        
        APIClient.userListClient.registerUser(data: uploadData)
            .sink { [weak self] in
                guard let self else { return }

                switch $0 {
                case .failure(let error):
                    self.errorText = error.localizedDescription
                    self.showingError = true
                    self.isLoading = false
                case .finished:
                    break
                }
            } receiveValue: { [weak self] data in
                guard let self else { return }
                
                print(data)
                
                self.isLoading = false
                
                let fails = data.fails
                
                if fails != nil {
                    self.errorText = self.onShowError(fails: fails)
                    self.showingError = true
                } else {
                    self.showResultScreen = true
                    self.resultScreenType = data.success ? .success : .tryAgain
                    self.resultMessage = data.message
                    
                    self.resetValues()
                }
            }
            .store(in: &subscriptions)
    }
    
    private func onShowError(fails: Fails?) -> String {
        var text: String = ""
        
        guard let fails = fails else {
            return text
        }
        
        if let nameFail = fails.name?.first {
            text = nameFail
        }
        
        if let emailFail = fails.email?.first {
            text += "\(emailFail) "
        }
        
        if let phoneFail = fails.phone?.first {
            text += "\(phoneFail) "
        }
        
        if let positionIdFail = fails.position_id?.first {
            text += "\(positionIdFail) "
        }
        
        if let photoFail = fails.photo?.first {
            text += "\(photoFail)"
        }
        
        return text
    }
    
    private func resetValues() {
        username = ""
        email = ""
        phone = ""
        selectedPhoto = nil
        selectedPosition = nil
    }
    
}
