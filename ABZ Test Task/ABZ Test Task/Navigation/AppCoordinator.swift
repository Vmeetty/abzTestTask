//
//  AppCoordinator.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/14/25.
//

import Foundation
import SwiftUI

enum NavigationRoute {
    case splash
    case reachability
    case home
}

final class AppCoordinator: ObservableObject {
    @Published var route: NavigationRoute = .splash

    func goTo(_ route: NavigationRoute) {
        self.route = route
    }
}
