//
//  UserDefaults+Extension.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation

// MARK: - AuthorizationState
enum AuthorizationState {
    case notAuthorized
    case locationRequired
    case categoriesRequired
    case preferencesRequired
    case authorized
}

// MARK: - Authorization

import Foundation

extension UserDefaults {

    enum Key: String {
        case firstOpen
    }

    func integer(for key: Key) -> Int {
        integer(forKey: key.rawValue)
    }

    func string(for key: Key) -> String? {
        string(forKey: key.rawValue)
    }

    func bool(for key: Key) -> Bool {
        bool(forKey: key.rawValue)
    }

    func set(_ integer: Int, for key: Key) {
        set(integer, forKey: key.rawValue)
    }

    func set(_ object: Any?, for key: Key) {
        set(object, forKey: key.rawValue)
    }
}

// MARK: - Authorizatio
extension UserDefaults {

    private var authorizationKey: String {
        "authorizationKey"
    }

    var authorization: Authorization? {
        guard let data = data(forKey: authorizationKey) else { return nil }
        return try? CodableService.decode(Authorization.self, from: data)
    }

    func setAuthorization(_ authorization: Authorization) {
        setValue(try? CodableService.encode(authorization), forKey: authorizationKey)
    }
}

