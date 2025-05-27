//
//  ProfileThreadFilter.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 24/05/25.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue}
}
