//
//  ThreadService.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 27/05/25.
//

import Foundation
import FirebaseFirestore

struct ThreadService {
    
    static func uploadThread(thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore()
            .collection("threads")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap { rawData in
            return try? rawData.data(as: Thread.self)
        }
    }
    
    static func fetchUserThreads(withUid uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore.firestore()
            .collection("threads")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        
        let threads = snapshot.documents.compactMap { rawData in
            return try? rawData.data(as: Thread.self)
        }
        
        return threads.sorted { a, b in
            a.timestamp.dateValue() > b.timestamp.dateValue()
        }
    }
}
