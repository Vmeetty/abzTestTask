//
//  Data+Extension.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/12/25.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
