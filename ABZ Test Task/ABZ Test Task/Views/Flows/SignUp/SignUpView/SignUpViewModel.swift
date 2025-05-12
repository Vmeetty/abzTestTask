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
    
    // MARK: - Properties
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Public funcs
    func onAppear() {
        getPostionList()
    }
    
    var isFormValid: Bool {
        isNameValid && isEmailValid && isPhoneValid && selectedPosition != nil
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
