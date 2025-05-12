//
//  CustomTextField.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI

enum FieldState {
    case enabled
    case focused
    case error
}

struct CustomTextField: View {
    let label: String
    let supportingText: String
    let validator: (String) -> String?
    @Binding var text: String
    @Binding var isValid: Bool

    @FocusState private var isFocused: Bool
    @State private var wasFocused = false

    var errorText: String? {
        let error = validator(text)
        isValid = (error == nil)
        return (!isFocused && wasFocused && error != nil) ? error : nil
    }

    var state: FieldState {
        if errorText != nil {
            return .error
        } else if isFocused {
            return .focused
        } else {
            return .enabled
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField(label, text: $text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .strokeBorder(borderColor(for: state), lineWidth: 1)
                )
                .focused($isFocused)
                .onChange(of: isFocused) { focused in
                    if !focused { wasFocused = true }
                }

            Text(errorText ?? "")
                .font(.caption)
                .foregroundColor(state == .error ? .red : .gray)
        }
    }

    private func borderColor(for state: FieldState) -> Color {
        switch state {
        case .enabled: return Color.gray.opacity(0.4)
        case .focused: return .blue
        case .error: return .red
        }
    }
}

//#Preview {
//    CustomTextField(label: "", supportingText: "", validator: {_ in ("")}, text: .constant(""), isFocused: false, wasFocused: false)
//}
