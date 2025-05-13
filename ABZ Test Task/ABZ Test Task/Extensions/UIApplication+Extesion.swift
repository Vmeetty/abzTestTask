//
//  UIApplication+Extesion.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/13/25.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
