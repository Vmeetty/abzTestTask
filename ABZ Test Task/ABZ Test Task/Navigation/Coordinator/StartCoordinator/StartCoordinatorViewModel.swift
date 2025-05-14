//
//  StartCoordinatorViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/13/25.
//

import SwiftUI

class StartCoordinatorViewModel: CoordinatorModel {
    
    override init() {}
    
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .start:
            SplashView(viewModel: SplashViewModel(title: "", onEvent: { event in
                switch event {
                case .goNoConnection:
                    self.push(.reachability)
                case .goHome:
                    self.push(.home)
                default:
                    break
                }
            }))
        case .reachability:
            ReachabilityView(viewModel: ReachabilityViewModel(onEvent: { event in
                switch event {
                case .goNext:
                    self.push(.home)
                default:
                    break
                }
            }))
        case .home:
            TabBarView()
        default:
            EmptyView()
        }
    }
    
}
