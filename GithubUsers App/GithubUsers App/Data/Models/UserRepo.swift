//
//  UserRepo.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import Foundation

// Model struct representing a GitHub repository
struct UserRepo: Identifiable, Decodable {
    let id: Int
    
    // Repository name
    let name: String
    
    // API URL of the repository
    let url: String
    
    // Main programming language
    private let _language: String?
    
    var language: String {
        _language ?? ""
    }
    
    // Repository description
    private let _description: String?
    
    var description: String {
        _description ?? ""
    }
    
    // Whether the repo is a fork
    let fork: Bool
    
    // stars count
    let stars: Int
    
    // Maps the JSON keys to the corresponding Swift properties
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
        case _language = "language"
        case _description = "description"
        case fork
        case stars = "stargazers_count"
    }
    
    // Custom initializer for creating a UserRepo instance
    init(
        id: Int,
        name: String,
        url: String,
        language: String?,
        description: String?,
        fork: Bool,
        stars: Int
    ) {
        self.id = id
        self.name = name
        self.url = url
        self._language = language
        self._description = description
        self.fork = fork
        self.stars = stars
    }
}
