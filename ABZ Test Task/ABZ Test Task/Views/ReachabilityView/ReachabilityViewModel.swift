//
//  ReachabilityViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/13/25.
//

import Foundation
import Network

class ReachabilityViewModel: BasicViewModel {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "ReachabilityMonitor")

    @Published var isConnected: Bool = false

    init(onEvent: @escaping (Event) -> Void) {
        super.init(title: "No Connection", onEvent: onEvent)
        
    }
    
    func goNext() {
        super.action()
    }
}
