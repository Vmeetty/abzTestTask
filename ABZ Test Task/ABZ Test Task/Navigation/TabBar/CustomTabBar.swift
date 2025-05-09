//
//  CustomTabBar.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 1/20/25.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: TabBarModel
    
    var body: some View {
        VStack {
            HStack {
                ForEach(TabBarModel.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: tab.imageValue)
                        .foregroundColor(.white)
                        .scaleEffect(tab == selectedTab ? 1.15 : 1.0)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 70)
            .background(.black)
        }
    
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(TabBarModel.userListTab))
}
