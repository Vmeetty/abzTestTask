//
//  Router.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import Foundation

// MARK: - OnboardingEndpoint
enum Endpoint {
    case getUserList(page: String, count: String)
}

// MARK: - OnboardingRouter
final class Router: BaseRouter {
    // MARK: - Private Properies
    private let endpoint: Endpoint
    private let tokenProvider: TokenProvider
    
    // MARK: - Initialization
    init(endpoint: Endpoint, tokenProvider: TokenProvider = TokenProvider(storage: SecureStorage())) {
        self.endpoint = endpoint
        self.tokenProvider = tokenProvider
    }
    
    // MARK: - Public Properies
    override var path: String {
        return "/api/v1/users"
    }
    
    override var method: HTTPMethod {
        switch endpoint {
        case .getUserList:
            return .get
        }
    }
    
    override var headers: [String: String]? {
        switch endpoint {
        case .getUserList:
            return ["accept": "application/json", "Content-Type": "application/json" ]
        }
    }
    
    override var queryItems: [URLQueryItem]? {
        switch endpoint {
        case .getUserList(let page, let count):
            return queryItems(["page": page, "count": count])
        }
    }
    
    override var body: Data? {
        switch endpoint {
        case .getUserList:
            return nil
        }
    }
    
    func queryItems(_ params: [String: String]) -> [URLQueryItem]? {
        var queryItems: [URLQueryItem] = []
        
        for key in params.keys {
            if let value = params[key], let queryItem = makeQueryItem(value, forKey: key) {
                queryItems.append(queryItem)
            }
        }
        
        return queryItems
    }
    
    func makeQueryItem(_ value: String, forKey key: String?) -> URLQueryItem? {
        guard let key = key else {
            return nil
        }
        return URLQueryItem(name: key, value: value)
    }
}
