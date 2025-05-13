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
    
    var body: some Scene {
        WindowGroup {
//            TabBarView()
            StartCoordinatorView(coordinatorModel: StartCoordinatorViewModel(), startScreen: .start)
        }
    }
}
