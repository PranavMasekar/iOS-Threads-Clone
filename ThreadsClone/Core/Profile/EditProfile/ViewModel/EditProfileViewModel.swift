//
//  EditProfileViewModel.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 26/05/25.
//

import Foundation
import PhotosUI
import SwiftUI

class EditProfileViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage() }
        }
    }
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    
    func updateUserData() async throws {
        try await uploadProfileImage()
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedImage else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        
        guard let uiImage = UIImage(data: data) else { return }
        
        self.profileImage = Image(uiImage: uiImage)
        self.uiImage = uiImage
    }
    
    private func uploadProfileImage() async throws {
        guard let image = self.uiImage else { return }
        
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
        
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
}
