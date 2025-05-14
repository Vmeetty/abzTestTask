//
//  ABZ_Test_TaskApp.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI

@main
struct ABZ_Test_TaskApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var coordinator = AppCoordinator()

        var body: some Scene {
            WindowGroup {
                RootView()
                    .environmentObject(coordinator)
            }
        }
}
