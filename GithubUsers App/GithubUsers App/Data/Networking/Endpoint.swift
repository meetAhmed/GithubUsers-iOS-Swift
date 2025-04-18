//
//  Endpoint.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import Foundation

// Protocol defining a basic endpoint
protocol Endpoint {
    var url: String { get }
}

// Endpoint for searching users
struct SearchUsersEndpoint: Endpoint {
    var url: String { AppConstants.base + "/search/users" }
}

// Endpoint for fetching user details
struct FetchUserDetailsEndpoint: Endpoint {
    private var username: String

    init(username: String) {
        self.username = username
    }

    var url: String { AppConstants.base + "/users/\(username)" }
}

// Endpoint for fetching user repositories
struct FetchUserReposEndpoint: Endpoint {
    private var username: String

    init(username: String) {
        self.username = username
    }

    var url: String { AppConstants.base + "/users/\(username)/repos" }
}
