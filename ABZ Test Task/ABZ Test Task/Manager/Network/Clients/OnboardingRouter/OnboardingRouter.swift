//
//  OnboardingRouter.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/12/25.
//

import Foundation


// MARK: - OnboardingEndpoint
enum OnboardingEndpoint {
    case getToken
}

// MARK: - OnboardingRouter
final class OnboardingRouter: BaseRouter {
    // MARK: - Private Properies
    private let endpoint: OnboardingEndpoint
    private let tokenProvider: TokenProvider
    
    // MARK: - Initialization
    init(endpoint: OnboardingEndpoint, tokenProvider: TokenProvider = TokenProvider(storage: SecureStorage())) {
        self.endpoint = endpoint
        self.tokenProvider = tokenProvider
    }
    
    // MARK: - Public Properies
    override var path: String {
        switch endpoint {
        case .getToken:
            return "/api/v1/token"
        }
    }

    override var method: HTTPMethod {
        switch endpoint {
        case .getToken:
            return .get
        }
    }
    
    override var headers: [String: String]? {
        switch endpoint {
        case .getToken:
            return ["accept": "application/json", "Content-Type": "application/json" ]
        }
    }
    
    override var queryItems: [URLQueryItem]? {
        switch endpoint {
        case .getToken:
            return nil
        }
    }
    
    override var body: Data? {
        switch endpoint {
        case .getToken:
            return nil
        }
    }
}
