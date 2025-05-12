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
    case getPositionList
    case registerUser(data: UploadDataWithFile)
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
        switch endpoint {
        case .getUserList:
            return "/api/v1/users"
        case .getPositionList:
            return "/api/v1/positions"
        case .registerUser:
            return "/api/v1/users"
        }
    }
    
    override var method: HTTPMethod {
        switch endpoint {
        case .getUserList, .getPositionList:
            return .get
        case .registerUser:
            return .post
        }
    }
    
    override var headers: [String: String]? {
        switch endpoint {
        case .getUserList, .getPositionList:
            return ["accept": "application/json", "Content-Type": "application/json"]
        case .registerUser(let data):
            return ["accept": "application/json", "Content-Type": "multipart/form-data; boundary=\(data.boundary)"]
        }
    }
    
    override var queryItems: [URLQueryItem]? {
        switch endpoint {
        case .getUserList(let page, let count):
            return queryItems(["page": page, "count": count])
        case .getPositionList, .registerUser:
            return nil
        }
    }
    
    override var body: Data? {
        switch endpoint {
        case .getUserList, .getPositionList:
            return nil
        case .registerUser(let data):
            return data.multipartBodyWithPhoto
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
