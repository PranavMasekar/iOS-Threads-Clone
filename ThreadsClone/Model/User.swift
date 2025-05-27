//
//  User.swift
//  ThreadsClone
//
//  Created by Pranav Masekar on 26/05/25.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
