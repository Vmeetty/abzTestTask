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
    @Published var submit = false
    @Published var positions: Positions = []
    @Published var selectedPosition: Position? = nil
    
    // MARK: - Properties
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Public funcs
    func onAppear() {
        getPostionList()
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
                self.positions = data.positions
            }
            .store(in: &subscriptions)

    }
    
}
