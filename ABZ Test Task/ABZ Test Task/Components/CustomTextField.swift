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
                        text = formatPhoneNumber(newValue)
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
    
    private func formatPhoneNumber(_ input: String) -> String {
        let digits = input.filter(\.isWholeNumber)
        let limited = String(digits.prefix(12))
        var result = "+"
        var index = limited.startIndex

        func next(_ count: Int) -> String {
            guard index < limited.endIndex else { return "" }
            let end = limited.index(index, offsetBy: count, limitedBy: limited.endIndex) ?? limited.endIndex
            let slice = limited[index..<end]
            index = end
            return String(slice)
        }

        let country = next(2)
        let area = next(3)
        let prefix = next(3)
        let suffix1 = next(2)
        let suffix2 = next(2)

        if !country.isEmpty { result += country }
        if !area.isEmpty { result += " (\(area))" }
        if !prefix.isEmpty { result += " \(prefix)" }
        if !suffix1.isEmpty { result += " - \(suffix1)" }
        if !suffix2.isEmpty { result += " - \(suffix2)" }

        return result
    }
}

//#Preview {
//    CustomTextField(label: "", supportingText: "", validator: {_ in ("")}, text: .constant(""), isFocused: false, wasFocused: false)
//}
