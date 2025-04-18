//
//  UserView.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import SwiftUI

struct SingleUserView: View {
    let user: User
    
    var body: some View {
        HStack {
            // AsyncImage to load and display the user's avatar
            AsyncImage(url: URL(string: user.avatarUrl)) { image in
                image.resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
            } placeholder: {
                // Display loading indicator while the image is being fetched
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(width: 50, height: 50)
            }
            
            // Display the user's login name
            Text(user.login)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
            
            // Chevron icon indicating a navigable item
            Image(systemName: "chevron.right")
                .foregroundColor(.primary)
        }
        .padding(8)
        .background(
            // Background with rounded corners and shadow for a card-like effect
            RoundedRectangle(cornerRadius: AppDimens.roundedCorner)
                .fill(Color.searchBox)
                .shadow(
                    color: Color.searchBox.opacity(0.15),
                    radius: 10,
                    x: 0,
                    y: 0
                )
        )
        .padding(.horizontal)
    }
}

#Preview {
    // Sample user for the preview
    let user =  User(
        id: 1,
        login: "johnDoe",
        avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4",
        reposUrl: "https://api.github.com/users/johnDoe/repos",
        name: "John Doe",
        followers: 120,
        following: 85
    )
    SingleUserView(user: user)
}
