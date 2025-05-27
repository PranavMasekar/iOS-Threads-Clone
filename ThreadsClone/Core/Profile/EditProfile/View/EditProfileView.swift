//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 25/05/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    let user: User
    
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    
                    HStack {
                        
                        VStack (alignment: .leading) {
                            
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text(user.fullname)
                        }
                        
                        Spacer()
                        
//                        CircularProfileImageView()
                        PhotosPicker(selection: $viewModel.selectedImage) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                        
                    } //: Name & Avatar
                    
                    Divider()
                    
                    VStack (alignment: .leading) {
                        
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio", text: $bio, axis: .vertical)
                    } //: Bio
                    
                    Divider()
                    
                    VStack (alignment: .leading) {
                        
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Add link...", text: $link)
                    } //: Link
                    
                    Divider()
                    
                    Toggle("Private profile", isOn: $isPrivateProfile)
                    
                } //: VStack
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
                
                
            } //: ZStack
            .navigationTitle("Edit Profile")
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
                    Button("Done") {
                        Task {
                            try await  viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    
                }
            }
            
        } //: NavigationStack
    }
}

#Preview {
    EditProfileView(user: DeveloperPreview.shared.user)
}
