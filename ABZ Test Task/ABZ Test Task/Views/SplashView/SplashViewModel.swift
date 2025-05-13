//
//  SplashViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import Foundation

class SplashViewModel: BasicViewModel {
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            super.action()
        }
    }
    
}
