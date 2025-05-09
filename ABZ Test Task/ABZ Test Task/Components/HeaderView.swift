//
//  HeaderView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 60)
                .foregroundStyle(Color("PrimaryColor"))
            Text(title)
        }
    }
}

#Preview {
    HeaderView(title: "Title")
}
