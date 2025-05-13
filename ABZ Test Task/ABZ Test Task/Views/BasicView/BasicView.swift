//
//  BasicView.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI

struct BasicView<Content: View>: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel: BasicViewModel
    @ViewBuilder let content: Content
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HeaderView(title: viewModel.title)
                    
                    content
                }
                .padding(.bottom, 70)
            }
            .alert(isPresented: $viewModel.showingError) {
                Alert (title: Text("Error"),
                       message: Text(viewModel.errorText),
                       dismissButton: .default(Text("Dismiss"), action: {
                    viewModel.showingError = false
                }))
            }
            
            LoadingView(isLoading: $viewModel.isLoading)
        }
    }
}
