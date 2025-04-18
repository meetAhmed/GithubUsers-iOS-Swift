//
//  DetailsViewModel.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import Combine
import Foundation

class DetailsViewModel: ObservableObject {
    // Store Combine subscriptions
    private var cancellables = Set<AnyCancellable>()
    
    // Holds the user details
    @Published var user: User? = nil
    
    // Holds the list of repositories
    @Published var repos: [UserRepo] = []
    
    // Holds any errors encountered
    @Published var error: Error?
    
    // Flag to indicate loading state
    @Published var isLoading = false
    
    // Network service to fetch data
    let service: NetworkService
    
    init(service: NetworkService = NetworkServiceImpl(urlSession: URLSession.shared)) {
        self.service = service
    }
    
    // Function to fetch user details and repositories concurrently
    @MainActor
    func fetchData(username: String) async {
        isLoading = true
        error = nil
        
        // Fetch user details and repositories concurrently using async let
        async let userDetails: Void = fetchUserDetails(username: username)
        async let userRepos: Void = fetchUserRepos(username: username)
        
        do {
            // Await both tasks to complete
            _ = try await (userDetails, userRepos)
            isLoading = false
        } catch {
            // Handle any errors encountered during fetching
            self.error = error
            isLoading = false
        }
    }
    
    // Fetch user details
    private func fetchUserDetails(username: String) async throws {
        user = try await service.fetchData(
            api: APIConstructorImpl(
                endpoint: FetchUserDetailsEndpoint(username: username)
            )
        ).decode()
    }
    
    // Fetch user repositories
    private func fetchUserRepos(username: String) async throws {
        repos = try await service.fetchData(
            api: APIConstructorImpl(
                endpoint: FetchUserReposEndpoint(username: username)
            )
        ).decode()
        repos = repos.filter { !$0.fork }
    }
    
    // Clear cancellables when the view model is deallocated
    deinit {
        cancellables.removeAll()
    }
}
