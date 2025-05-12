//
//  OnboardingClient.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/12/25.
//

import Foundation
import Combine

protocol OnboardingClientProtocol {
    func getToken() -> AnyPublisher<Authorization, Error>
}

final class OnboardingClient: OnboardingClientProtocol {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getToken() -> AnyPublisher<Authorization, Error> {
        networkService.performRequest(route: OnboardingRouter(endpoint: .getToken), isAthorizedRequired: false)
    }
}
