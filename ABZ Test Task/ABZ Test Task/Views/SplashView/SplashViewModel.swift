//
//  SplashViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import Foundation

class SplashViewModel: BasicViewModel {
    var reachability: Bool = false
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            if !self.reachability {
                self.event = .goNoConnection
            } else {
                self.event = .goHome
            }
            super.action()
        }
    }
    
}
