//
//  APIClient.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation

struct APIClient {
    private static let networkService = NetworkService()
    
    static let passportRenewalClient: UserListClientProtocol = UserListClient(networkService: networkService)
}
