//
//  AppDelegate.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    static var restrictRotation: UIInterfaceOrientationMask = .portrait
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.restrictRotation
    }
}
