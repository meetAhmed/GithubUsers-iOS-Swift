//
//  DetailsView.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import SwiftUI

struct DetailsView: View {
    // GitHub username to display details for
    let username: String
    
    // ViewModel to fetch data
    @StateObject private var vm = DetailsViewModel()
    
    // To dismiss the view
    @Environment(\.presentationMode) var presentationMode
    
    // Flag to show the alert
    @State private var showAlert = false
    
    // Message for the alert
    @State private var alertMessage = ""
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                
                // Display user details if available
                if let user = vm.user {
                    SingleUserDetailsView(user: user)
                }
                
                Spacer()
                
                // Show a loading indicator when data is being fetched
                if vm.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(width: 50, height: 50)
                }
                
                // Show error message if there is an error
                if let error = vm.error {
                    Text("Error: \(error)")
                }
                
                // Display repositories
                LazyVStack(spacing: 20) {
                    ForEach(vm.repos) { repo in
                        SingleRepoView(repo: repo)
                            .onTapGesture {
                                alertMessage = repo.url
                                showAlert = true
                            }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .toolbarBackground(Color.blue, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
            // Custom back button in the toolbar
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(.primary)
                }
            }
        })
        .task {
            await vm.fetchData(username: username)
        }
        .alert("Repo Url", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }
}

#Preview {
    DetailsView(username: "meetAhmed")
}
