//
//  TabBarViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation
import Combine

class TabBarViewModel: ObservableObject {
    
    @Published var errorText = ""
    @Published var showingError = false
    @Published var selectedTab: TabBarModel = .userListTab
    @Published var showTabBar = true
    @Published var showEvent = false
    
    private var subscriptions = Set<AnyCancellable>()
    let tokenProvider: TokenProvider = TokenProvider(storage: SecureStorage())
    
    init() {
        
    }
    
}
