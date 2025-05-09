//
//  UserListViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI
import Combine

class UserListViewModel: BasicViewModel {
    
    // MARK: - Wrapped Properties
    @Published var users: Users?
    
    // MARK: - Properties
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Public funcs
    func onAppear() {
        getUserList()
    }
   
    // MARK: - Private funcs
    private func getUserList() {
        isLoading = true
        APIClient.userListClient.getUserList(page: "2", count: "10")
            .sink { [weak self] in
                switch $0 {
                case .failure(let error):
                    self?.errorText = error.localizedDescription
                    self?.showingError = true
                    self?.isLoading = false
                case .finished:
                    break
                }
            } receiveValue: { [weak self] data in
                guard let self = self else {
                    return
                }
                
                self.users = data
                
                self.isLoading = false
            }
            .store(in: &subscriptions)

    }
    
    
}
