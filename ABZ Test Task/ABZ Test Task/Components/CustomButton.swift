//
//  CustomButton.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/13/25.
//

import SwiftUI

struct CustomButton: View {
    var label: String
    var isEnabled: Bool
    var action: () -> Void
    
    var body: some View {
        Button(label) {
            action()
        }
        .buttonStyle(CustomButtonStyle(isEnabled: isEnabled))
        .disabled(!isEnabled)
    }
}

#Preview {
    CustomButton(label: "Enabled", isEnabled: true, action: {})
}
