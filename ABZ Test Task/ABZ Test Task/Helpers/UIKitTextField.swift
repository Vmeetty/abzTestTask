//
//  UIKitTextField.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/19/25.
//

import SwiftUI

struct UIKitTextField: UIViewRepresentable {
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let isSecure: Bool

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.textColor = UIColor(named: "StrongGrayColor")
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = isSecure
        textField.borderStyle = .none
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: UIColor.black]
        )
        textField.addTarget(context.coordinator, action: #selector(Coordinator.textChanged(_:)), for: .editingChanged)
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: UIKitTextField

        init(_ parent: UIKitTextField) {
            self.parent = parent
        }

        @objc func textChanged(_ sender: UITextField) {
            parent.text = sender.text ?? ""
        }
    }
}
