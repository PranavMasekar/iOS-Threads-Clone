//
//  ThreadCreationViewModel.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 27/05/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ThreadCreationViewModel: ObservableObject {
    
    @Published var caption = ""
    
    func uploadThread() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let thread = Thread(
            ownerUid: uid,
            caption: caption,
            timestamp: Timestamp(),
            likes: 0
        )
        
        try await ThreadService.uploadThread(thread: thread)
    }
}
