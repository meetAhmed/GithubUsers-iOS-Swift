//
//  APIConstructor.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import Foundation

// Typealias for request parameters
typealias Parameters = [String: String]

// Supported HTTP methods
enum MHttpMethods {
    case get, post
    
    var rawValue: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}

// Protocol defining API configuration
protocol APIConstructor {
    var endpoint: Endpoint { get }
    var queryParams: Parameters { get }
    var headers: Parameters { get }
    var httpMethod: MHttpMethods { get }
}

// Default implementation of APIConstructor
struct APIConstructorImpl: APIConstructor {
    let endpoint: Endpoint
    var queryParams: Parameters = [:]
    var headers: Parameters = [:]
    var httpMethod: MHttpMethods = .get
}
