//
//  UserDetailsView.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import SwiftUI

struct SingleUserDetailsView: View {
    let user: User
    
    var body: some View {
        VStack {
            // AsyncImage to load and display the user's avatar
            AsyncImage(url: URL(string: user.avatarUrl)) { image in
                image.resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
            } placeholder: {
                // Display loading indicator while the image is being fetched
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(width: 150, height: 150)
            }
            
            // Display the user's login name
            Text(user.login)
                .font(.headline)
                .foregroundColor(.primary)
            
            // Display the user's full name
            Text(user.name)
                .font(.title)
                .foregroundColor(.primary)
            
            // Followers and Following information
            HStack {
                Text("Followers ")
                Text("\(user.followers)")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("Following ")
                    .padding(.leading)
                Text("\(user.following)")
                    .font(.headline)
                    .fontWeight(.bold)
            }
        }
        .frame(maxWidth: .infinity)
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
    SingleUserDetailsView(user: user)
}
