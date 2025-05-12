//
//  PhotoUploadField.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/12/25.
//

import SwiftUI

struct PhotoUploadField: View {
    let label: String
    let errorText: String?
    let isValid: Bool
    let hasPhoto: Bool
    let onUpload: () -> Void
    let onRemove: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(label)
                    .foregroundColor(isValid ? .primary : .red)

                Spacer()

                Button(hasPhoto ? "Remove" : "Upload") {
                    hasPhoto ? onRemove() : onUpload()
                }
                .foregroundColor(hasPhoto ? .red : .blue)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(isValid ? Color.gray.opacity(0.4) : Color.red, lineWidth: 1)
            )

            if !isValid, let errorText {
                Text(errorText)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
//    PhotoUploadField(label: "Select your photo", uploadTitle: "Select", errorText: "Photo is required", action: {}, isValid: false)
    PhotoUploadField(label: "Select your photo", errorText: "Photo is required", isValid: false, hasPhoto: false, onUpload: {}, onRemove: {})
}
