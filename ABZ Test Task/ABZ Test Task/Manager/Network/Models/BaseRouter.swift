//
//  BaseRouter.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation

enum BaseException: Error {
    case emptyUrl
}

class BaseRouter {
    var baseUrl: String {
        "https://frontend-test-assignment-api.abz.agency/api/v1"
    }
    
    var method: HTTPMethod {
        fatalError("You have to override method property")
    }

    var path: String {
        return .empty
    }

    var headers: [String: String]? {
        return nil
    }

    var queryItems: [URLQueryItem]? {
        return nil
    }

    var body: Data? {
        return nil
    }

    func asURLRequest() throws -> URLRequest {
        var components = URLComponents(string: baseUrl)!

        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url?.absoluteString.removingPercentEncoding else {
            throw BaseException.emptyUrl
        }

        let urlFromString = URL(string: url.replacingOccurrences(of: " ", with: ""))
        guard let urlFromString = urlFromString else { throw BaseException.emptyUrl }
        var request = URLRequest(url: urlFromString)

        request.httpMethod = method.rawValue
        request.httpBody = body
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        headers?.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        return request
    }
}
