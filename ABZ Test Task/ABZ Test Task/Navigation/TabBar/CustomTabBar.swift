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
                    HStack {
                        Image(systemName: tab.imageValue)
                        Text(tab.title)
                    }
                    .foregroundColor(tab == selectedTab ? Color("SecondaryColor") : Color("StrongGrayColor"))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 70)
            .background(Color("SecondaryGrayColor"))
        }
    
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(TabBarModel.userListTab))
}
