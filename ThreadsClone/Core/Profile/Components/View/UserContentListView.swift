//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 26/05/25.
//

import SwiftUI

struct UserContentListView: View {
    var user: User
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    @StateObject var viewModel: UserContentListViewModel

    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    
    private var filterBarWidth : CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        
        return UIScreen.main.bounds.width / count - 20
    }
    
    var body: some View {
        VStack {
            
            HStack {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: filterBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: filterBarWidth, height: 1)
                        }
                        
                    } //: VStack
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedFilter = filter
                        }
                    }
                }
            } //: HStack
            
            LazyVStack {
                ForEach (viewModel.threads) { thread in
                    ThreadCell(thread: thread)
                }
            }
            
        } //: User Content
        .padding(.vertical, 8)
        
        
    } //: VStack
}

#Preview {
    UserContentListView(user: DeveloperPreview.shared.user)
}
