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
    @Published var userList: Users?
    
    // MARK: - Properties
    private var subscriptions = Set<AnyCancellable>()
    
   
    
    // MARK: - Private funcs

    
}
