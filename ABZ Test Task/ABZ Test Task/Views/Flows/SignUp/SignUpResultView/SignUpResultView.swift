//
//  SignUpResultView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/13/25.
//

import SwiftUI

enum SignUpResultScreenType {
    case success, tryAgain, none
}

struct SignUpResultView: View {
    @Binding var show: Bool
    let type: SignUpResultScreenType
    var message: String = ""
    
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation {
                    show = false
                }
            }, label: {
                Image("close")
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
            
            VStack {
                switch type {
                case .success:
                    Image("success-image")
                case .tryAgain:
                    Image("failed-image")
                case .none:
                    EmptyView()
                }
                
                Text(message)
                    .padding()
                
                CustomButton(
                    label: type == .success ? "Got it" : "Try again",
                    isEnabled: true)
                {
                    withAnimation {
                        show = false
                    }
                }
            }
        }
        .background(Color(.white))
    }
}

#Preview {
    SignUpResultView(show: .constant(true), type: .success)
}
