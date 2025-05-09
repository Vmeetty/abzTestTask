//
//  CustomTextField.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI

struct CustomTextField: View {
    let title: String
    @Binding var value: FieldState
    var errorMessage: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField(title, text: $value.value, onEditingChanged: { isEditing in
                if !isEditing {
                    value.wasTouched = true
                }
            })
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(errorMessage != nil ? Color.red : Color.gray)
            )
            
            if let error = errorMessage {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    CustomTextField(title: "Placeholder", value: .constant(FieldState()))
}
