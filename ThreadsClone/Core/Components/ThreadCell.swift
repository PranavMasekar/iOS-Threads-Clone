//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 24/05/25.
//

import SwiftUI

struct ThreadCell: View {
    
    let thread: Thread
    
    var body: some View {
        VStack {
            HStack (alignment: .top, spacing: 12) {
                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack (alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack (spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    } //: HStack
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                    
                } //: VStack
                
            } //: HStack
            
            Divider()
        } //: VStack
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    ThreadCell(thread: DeveloperPreview.shared.thread)
}
