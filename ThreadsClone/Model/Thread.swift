//
//  Thread.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 27/05/25.
//

import Foundation
import FirebaseFirestore

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
}
