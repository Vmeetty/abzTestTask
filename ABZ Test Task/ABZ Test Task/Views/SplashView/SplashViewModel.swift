//
//  SplashViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import Foundation

class SplashViewModel: BasicViewModel {
 
    func goNoConnection() {
        self.event = .goNoConnection
        super.action()
    }
    
    func goHome() {
        self.event = .goHome
        super.action()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//        }
    }
    
}
