//
//  ExportViewModel.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 26/05/25.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
