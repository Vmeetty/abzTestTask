//
//  TokenProvider.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation

protocol TokenProviderable {
    var accessToken: String? { get set }
}

class TokenProvider: TokenProviderable {
    
    private enum Constants {
        static let accessToken: String = "accessToken"
        static let refreshKey: String = "refreshKey"
    }
    private let storage: SecureStorage
    init(storage: SecureStorage) {
        self.storage = storage
    }
    
    var accessToken: String? {
        get {
            guard let token = storage.get(value: Constants.accessToken), !token.isEmpty else {
                return nil
            }
            return token
        }
        set {
            guard newValue != accessToken else { return }
            storage.set(value: Constants.accessToken, for: newValue ?? "")
        }
    }
    
    var refreshToken: String? {
        get {
            guard let token = storage.get(value: Constants.refreshKey), !token.isEmpty else {
                return nil
            }
            return token
        }
        set {
            guard newValue != refreshToken else { return }
            storage.set(value: Constants.refreshKey, for: newValue ?? "")
        }
    }
}
