//
//  FeedView.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 24/05/25.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView (showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                } //: VStack
            } //: ScrollView
            .refreshable {
                Task { try await viewModel.fetchThreads() }
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
