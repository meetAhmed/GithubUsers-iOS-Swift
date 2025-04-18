//
//  NetworkService.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import Foundation

// Error for handling invalid status codes
enum NetworkServiceError: Error {
    case invalidStatusCode
}

// Protocol defining a contract for network data fetching
protocol NetworkService {
    func fetchData(api: APIConstructor) async throws -> Data
}

// Default implementation using URLSession
class NetworkServiceImpl: NetworkService {
    private var urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    // Fetches data from the given API configuration
    func fetchData(api: APIConstructor) async throws -> Data {
        let url = try DefaultURLBuilder.build(for: api.endpoint, params: api.queryParams)
        var urlRequest = URLRequest(url: url)

        // Add HTTP method
        urlRequest.httpMethod = api.httpMethod.rawValue
        
        // Add headers if present
        for (key, value) in api.headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        // Add default Authorization header if not already present
        if !AppConstants.githubToken.isEmpty {
            urlRequest.addValue("Bearer \(AppConstants.githubToken)", forHTTPHeaderField: "Authorization")
        }
        
        let (data, response) = try await urlSession.data(for: urlRequest)

        guard let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300
        else {
            throw NetworkServiceError.invalidStatusCode
        }

        return data
    }
}
