//
//  RadioButtonRow.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/10/25.
//

import SwiftUI

struct RadioButtonRow: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isSelected ? "record.circle.fill" : "circle")
                    .foregroundColor(isSelected ? Color.cyan : .gray)
                    .font(.system(size: 20))

                Text(title)
                    .foregroundColor(.black)

                Spacer()
            }
            .padding(.vertical, 4)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    RadioButtonRow(title: "Frontend", isSelected: true, action: {})
}
