//
//  UserService.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 26/05/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        
        let user = try snapshot.data(as: User.self)
        
        self.currentUser = user
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let uid = Auth.auth().currentUser?.uid else { return [] }
        
        print("USER ID IN USER SERVICE: \(uid)")
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        let users = snapshot.documents.compactMap { rawUser in
            try? rawUser.data(as: User.self)
        }
        
        return users.filter { user in
            user.id != uid
        }
    }
    
    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        try await Firestore.firestore().collection("users").document(uid).updateData([
            "profileImageUrl" : imageUrl
        ])
        
        self.currentUser?.profileImageUrl = imageUrl
    }
    
    static func fetchUser(withUid uid: String) async throws -> User? {
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        
        let user = try snapshot.data(as: User.self)
        
        return user
    }
    
    func reset() {
        self.currentUser = nil
    }
}
