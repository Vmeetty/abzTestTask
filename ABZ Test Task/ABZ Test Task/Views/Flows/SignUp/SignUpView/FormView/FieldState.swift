//
//  FieldState.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/10/25.
//

import Foundation

struct FieldState {
    var value: String = ""
    var wasTouched: Bool = false

    var isEmpty: Bool {
        value.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
