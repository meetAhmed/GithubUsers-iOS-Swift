//
//  HomeView.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import SwiftUI

struct HomeView: View {
    // ViewModel
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        VStack {
            // Search bar for entering text to search users
            SearchView(searchedText: $vm.searchedText)
            
            Spacer()
            
            // Show loading indicator when data is being fetched
            if vm.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(width: 50, height: 50)
            }
            
            // Show error message if there's an error
            if let error = vm.error {
                Text("Error: \(error)")
            }
            
            // Display list of users
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    // For each user, display a navigation link to their details view
                    ForEach(vm.users) { user in
                        NavigationLink(value: user) {
                            SingleUserView(user: user)
                        }
                    }
                }
            }
        }
        .background(Color.background)
        .navigationTitle("GithubUsers App")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: User.self) { user in
            // Navigation destination for user details view
            DetailsView(username: user.login)
        }
    }
}

#Preview {
    HomeView()
}
