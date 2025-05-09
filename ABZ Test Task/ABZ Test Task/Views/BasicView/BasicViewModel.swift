//
//  BasicViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI
import Combine

class BasicViewModel: ObservableObject {
    
    @Published var title: String
    @Published var errorText = ""
    @Published var showingError = false
    @Published var isLoading = false
    
    var event: Event = .goNext
    private var onEvent: ((Event) -> Void)?
    
    init(title: String, onEvent: @escaping (Event) -> Void) {
        self.title = title
        self.onEvent = onEvent
    }
    
    // button action
    func action() {
        onEvent?(event)
    }
    
}
