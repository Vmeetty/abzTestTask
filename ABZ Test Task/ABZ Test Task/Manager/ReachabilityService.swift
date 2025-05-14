//
//  ReachabilityService.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/14/25.
//

import Network
import Foundation

final class ReachabilityService: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")

    @Published var isConnected: Bool = true

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = (path.status == .satisfied)
            }
        }
        monitor.start(queue: queue)
    }
}
