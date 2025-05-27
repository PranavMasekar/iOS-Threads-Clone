//
//  CreateThreadView.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 24/05/25.
//

import SwiftUI

struct CreateThreadView: View {
    
    @StateObject var viewModel = ThreadCreationViewModel()
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            
            VStack {
                HStack (alignment: .top) {
                    
                    CircularProfileImageView(user: user, size: .small)
                    
                    VStack (alignment: .leading, spacing: 4) {
                        
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        
                        TextField("Start thread", text: $viewModel.caption, axis: .vertical)
                        
                    } //: VStack
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !viewModel.caption.isEmpty {
                        Button {
                            viewModel.caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                    
                } //: HStack
                
                Spacer()
                
            } //: VStack
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        Task {
                            try await viewModel.uploadThread()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .opacity(viewModel.caption.isEmpty ? 0.5 : 1.0)
                    .disabled(viewModel.caption.isEmpty)
                    
                }
            }
            
        } //: NavigationStack
    }
}

#Preview {
    CreateThreadView()
}
