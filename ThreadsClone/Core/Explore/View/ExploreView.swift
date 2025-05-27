//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 24/05/25.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            
            ScrollView (showsIndicators: false) {
                LazyVStack {
                    ForEach( viewModel.users ) { user in
                        NavigationLink(value: user) {
                            VStack  {
                                UserCell(user: user)
                                
                                Divider()
                                
                            } //: VStack
                            .padding(.vertical, 4)
                        }
                    } //: ForEach
                } //: LVStack
            } //: ScrollView
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $viewModel.searchText, prompt: "Search")
        } //: NavigationStack
    }
}

#Preview {
    ExploreView()
}
