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
    
    var deletingPathExtension: String {
        return NSString(string: self).deletingPathExtension
    }
}

extension String {
    var isValidName: Bool {
        let regex = "^[A-Za-zА-Яа-яґҐїЇєЄіІ]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    var isValidEmail: Bool {
        let regex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    var isValidPhone: Bool {
        let regex = #"^\+380 \(\d{2}\) \d{3} - \d{2} - \d{2}$"#
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
}
