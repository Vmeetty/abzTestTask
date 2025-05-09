//
//  EmptyResponse.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation

struct EmptyResponse: Codable { }

extension Encodable {
    var dataEncodable: Data? {
        try? CodableService.defaultEncoder.encode(self)
    }
}

