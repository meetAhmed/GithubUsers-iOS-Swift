//
//  HomeViewModel.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    // Text entered by the user in the search bar
    @Published var searchedText = ""
    
    // Store Combine subscriptions
    private var cancellables = Set<AnyCancellable>()
    
    // List of users fetched
    @Published var users: [User] = []
    
    // Error encountered while fetching data
    @Published var error: Error?
    
    // Track if data is being loaded
    @Published var isLoading = false
    
    // Network service instance
    let service: NetworkService
    
    init(service: NetworkService = NetworkServiceImpl(urlSession: URLSession.shared)) {
        self.service = service
        
        // Observe changes to searchedText with debounce and remove duplicates
        // Add delay before triggering search
        $searchedText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] text in
                guard let self else { return }
                if !text.isEmpty {
                    Task {
                        // Fetch users when search text is not empty
                        await self.fetchUsers(for: text)
                    }
                }
            }
            .store(in: &cancellables) // Store the subscription
    }
    
    // Fetch users matching the search query
    @MainActor
    func fetchUsers(for username: String) async {
        isLoading = true
        do {
            let response: UsersApiResponse = try await service.fetchData(
                api: APIConstructorImpl(
                    endpoint: SearchUsersEndpoint(),
                    queryParams: ["q": username]
                )
            ).decode()
            
            users = response.items
            isLoading = false
        } catch {
            self.error = error
            isLoading = false
        }
    }
    
    // Clear cancellables when the view model is deallocated
    deinit {
        cancellables.removeAll()
    }
}
