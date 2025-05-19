//
//  PositionSelectionView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/10/25.
//

import SwiftUI

struct PositionSelectionView: View {
    @Binding var selectedPosition: Position?
    
    let positions: [Position]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Select your position")
                .font(.headline)
                .foregroundStyle(.black)

            ForEach(positions) { position in
                RadioButtonRow(
                    title: position.name,
                    isSelected: selectedPosition == position
                ) {
                    selectedPosition = position
                }
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    PositionSelectionView(selectedPosition: .constant(Position(id: 1, name: "frontend")), positions: [Position(id: 1, name: "frontend"), Position(id: 2, name: "QA")])
}
