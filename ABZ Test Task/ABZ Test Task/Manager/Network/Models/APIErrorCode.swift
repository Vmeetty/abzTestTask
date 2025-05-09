//
//  APIErrorCode.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation

enum APIErrorCode: String {
    // MARK: - Default
    case `default` = "default_error_code"

    // MARK: - Auth
    case accessTokenRequired = "access_token_required"
    case accessTokenNotExpired = "access_token_not_expired"
    case accessTokenInvalidAlgorithm = "access_token_invalid_algorithm"
    case accessTokenSecurityIssue = "access_token_security_issue"
    case refreshTokenRequired = "refresh_token_required"
    case refreshTokenNotExist = "refresh_token_not_exist"
    case refreshTokenExpired = "refresh_token_expired"
    case refreshTokenUsed = "refresh_token_used"
    case refreshTokenNotMatchJwt = "refresh_token_not_match_jwt"
}

extension APIErrorCode {
    var localizedMessage: String {
        "Request failed!"
    }
}
