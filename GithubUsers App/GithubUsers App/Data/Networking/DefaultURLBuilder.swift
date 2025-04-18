//
//  DefaultURLBuilder.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import Foundation

// Custom errors for URL building
enum URLBuilderError: Error {
    case invalidFullPath, invalidURL
}

enum DefaultURLBuilder {
    // Default query parameters
    private static var defaultQueryParams: [String: String] = [:]
    
    // Builds a complete URL from endpoint and query parameters
    static func build(for endpoint: Endpoint, params: [String: String] = [:]) throws -> URL {
        guard var urlComponents = URLComponents(string: endpoint.url) else {
            throw URLBuilderError.invalidFullPath
        }
        
        urlComponents.queryItems = buildQueryItems(defaultQueryParams, params)
        
        guard let url = urlComponents.url else {
            throw URLBuilderError.invalidURL
        }
        
        return url
    }
}

private extension DefaultURLBuilder {
    // Converts dictionaries into query items
    static func buildQueryItems(_ params: [String: String]...) -> [URLQueryItem] {
        params.flatMap { $0 }.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
