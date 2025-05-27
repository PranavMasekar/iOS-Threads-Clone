//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 24/05/25.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        
        ScrollView (showsIndicators: false) {
            
            VStack (spacing: 20) {
                ProfileHeaderView(user: user)
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                UserContentListView(user: user)
                
            } //: ScrollView
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}
