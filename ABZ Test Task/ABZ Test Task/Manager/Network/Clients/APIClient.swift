//
//  APIClient.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation

struct APIClient {
    private static let networkService = NetworkService()
    
    static let onboardingClient: OnboardingClientProtocol = OnboardingClient(networkService: networkService)
    static let userListClient: UserListClientProtocol = UserListClient(networkService: networkService)
}
