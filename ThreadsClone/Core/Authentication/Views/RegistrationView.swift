//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 24/05/25.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewModel()

    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("threads-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .modifier(TextFieldModifier())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(TextFieldModifier())
                
                TextField("Enter your full name", text: $viewModel.fullName)
                    .modifier(TextFieldModifier())
                
                TextField("Enter your username", text: $viewModel.userName)
                    .textInputAutocapitalization(.never)
                    .modifier(TextFieldModifier())
            } //: VStack
            
            Button {
                Task {
                    try await viewModel.createUser()
                }
            } label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 44)
                    .background(.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack (spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundColor(.black)
            }
            .padding(.vertical, 16)
            
        } //: VStack
    }
}

#Preview {
    RegistrationView()
}
