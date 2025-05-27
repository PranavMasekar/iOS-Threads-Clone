//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 26/05/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    
    init(user: User? = nil) {
        self.user = user
    }
    
    var body: some View {
        // Bio and Stats
        HStack (alignment: .top) {
            VStack (alignment: .leading, spacing: 12) {
                
                // FullName and UserName
                VStack (alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                } //: Name
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("2 followers")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            } //: Bio
            
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
            
        } //: HStack
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.shared.user)
}
