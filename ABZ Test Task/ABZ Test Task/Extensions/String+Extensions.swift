//
//  String+Extensions.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import Foundation

extension String {
    static var empty: String {
        String()
    }
}

extension String {
    var isValidEmail: Bool {
        let regex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
}

