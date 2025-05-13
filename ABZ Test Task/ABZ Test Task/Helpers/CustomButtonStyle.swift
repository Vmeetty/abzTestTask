//
//  CustomButtonStyle.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/13/25.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var isEnabled: Bool = true

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(
                isEnabled
                ? (configuration.isPressed ? Color.yellow.opacity(0.8) : Color.yellow)
                : Color.gray.opacity(0.3)
            )
            .foregroundColor(.black.opacity(isEnabled ? 1 : 0.5))
            .clipShape(Capsule())
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
