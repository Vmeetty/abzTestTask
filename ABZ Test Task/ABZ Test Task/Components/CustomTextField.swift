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

enum TextFieldType {
    case name
    case email
    case phone
}

struct CustomTextField: View {
    let label: String
    let validator: (String) -> String?
    @Binding var text: String
    @Binding var isValid: Bool
    var type: TextFieldType = .name

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
            TextField(label, text: Binding(
                get: { text },
                set: { newValue in
                    if type == .phone {
                        text = formatPhoneInput(newValue)
                    } else {
                        text = newValue
                    }
                }
            ))
            .keyboardType(keyboardType(for: type))
            .textContentType(textContentType(for: type))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(borderColor(for: state), lineWidth: 1)
            )
            .focused($isFocused)
            .onChange(of: isFocused) { oldValue, newValue in
                if !newValue { wasFocused = true }
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
    
    private func keyboardType(for type: TextFieldType) -> UIKeyboardType {
        switch type {
        case .email: return .emailAddress
        case .phone: return .numberPad
        case .name: return .default
        }
    }
    
    private func textContentType(for type: TextFieldType) -> UITextContentType? {
        switch type {
        case .email: return .emailAddress
        case .phone: return .telephoneNumber
        case .name: return .name
        }
    }

    private func formatPhoneInput(_ input: String) -> String {
        let digits = input.filter(\.isWholeNumber)
        var result = "+38"
        var index = digits.index(digits.startIndex, offsetBy: 2, limitedBy: digits.endIndex) ?? digits.endIndex
        if index > digits.startIndex {
            result = "+" + digits.prefix(2)
        }

        let remaining = digits.suffix(from: index)
        var formatted = ""

        if remaining.count > 0 { formatted += " (" }
        if remaining.count >= 3 {
            formatted += remaining.prefix(3) + ") "
        } else {
            formatted += remaining
            return result + formatted
        }

        if remaining.count >= 6 {
            formatted += remaining.dropFirst(3).prefix(3) + " - "
        } else {
            formatted += remaining.dropFirst(3)
            return result + formatted
        }

        if remaining.count >= 8 {
            formatted += remaining.dropFirst(6).prefix(2) + " - "
        } else {
            formatted += remaining.dropFirst(6)
            return result + formatted
        }

        formatted += remaining.dropFirst(8).prefix(2)

        return result + formatted
    }
}

//#Preview {
//    CustomTextField(label: "", supportingText: "", validator: {_ in ("")}, text: .constant(""), isFocused: false, wasFocused: false)
//}
