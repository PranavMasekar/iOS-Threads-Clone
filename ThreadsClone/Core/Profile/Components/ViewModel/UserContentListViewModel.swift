//
//  UserContentListViewModel.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 27/05/25.
//

import Foundation

class UserContentListViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserThread()}
    }
    
    @MainActor
    func fetchUserThread() async throws {
        var threads = try await ThreadService.fetchUserThreads(withUid: user.id)
        
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        
        self.threads = threads
    }
}
