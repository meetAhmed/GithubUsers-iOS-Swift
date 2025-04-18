//
//  User.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import Foundation

struct UsersApiResponse: Decodable {
    let items: [User]
}

// Model struct representing a GitHub user
struct User: Identifiable, Decodable, Hashable {
    let id: Int
    
    // Username/login
    let login: String
    
    // Profile image URL
    let avatarUrl: String
    
    // URL to user's repositories
    let reposUrl: String
    
    // Full name (optional, since it might be null in the API response)
    private let _name: String?
    
    // Number of followers
    private let _followers: Int?
    
    // Number of following
    private let _following: Int?
    
    // Public computed property for full name
    // Return a default if name is nil
    var name: String {
        return _name ?? "--"
    }
    
    // Public computed properties for followers
    var followers: Int {
        return _followers ?? 0
    }
    
    // Public computed properties for following
    var following: Int {
        return _following ?? 0
    }
    
    // Maps the JSON keys to the corresponding Swift properties
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case reposUrl = "repos_url"
        case _name = "name"
        case _followers = "followers"
        case _following = "following"
    }
    
    // Custom initializer for creating a User instance
    init(id: Int, login: String, avatarUrl: String, reposUrl: String, name: String, followers: Int, following: Int) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
        self.reposUrl = reposUrl
        self._name = name
        self._followers = followers
        self._following = following
    }
}
