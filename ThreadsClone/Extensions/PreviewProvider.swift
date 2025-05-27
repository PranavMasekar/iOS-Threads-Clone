//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 26/05/25.
//

import Foundation
import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Pranav Masekar", email: "pranavmasekar4@gmail.com", username: "pranav_masekar")
    
    let thread = Thread(ownerUid: "", caption: "This is preview thread", timestamp: Timestamp(), likes: 0)
}
