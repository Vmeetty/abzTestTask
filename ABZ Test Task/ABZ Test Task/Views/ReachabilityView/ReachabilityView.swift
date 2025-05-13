//
//  ReachabilityView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/13/25.
//

import SwiftUI

struct ReachabilityView: View {
    @StateObject var viewModel: ReachabilityViewModel
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            CustomButton(label: "Try again", isEnabled: true) {
                viewModel.goNext()
            }
        }
    }
}

#Preview {
    ReachabilityView(viewModel: ReachabilityViewModel(title: "", onEvent: { _ in }))
}
