//
//  Encodable+Extensions.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation

extension Encodable {
    var data: Data? {
        try? CodableService.defaultEncoder.encode(self)
    }
}
