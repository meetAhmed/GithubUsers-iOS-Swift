//
//  SingleRepoView.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import SwiftUI

struct SingleRepoView: View {
    let repo: UserRepo
    
    var body: some View {
        VStack(alignment: .leading) {
            // Display repo name with stars count
            HStack {
                Text(repo.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                Text("\(repo.stars)")
                Image(systemName: "star.fill")
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            
            // Display the repo's language
            Text(repo.language)
                .font(.callout)
                .foregroundColor(.primary)
            
            // Display the repo's description
            Text(repo.description)
                .font(.callout)
                .foregroundColor(.primary)
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
    // Sample repo for preview
    SingleRepoView(
        repo: UserRepo(
            id: 1,
            name: "awesome-repo",
            url: "https://github.com/username/awesome-repo",
            language: "Swift",
            description: "A cool Swift project to demo GitHub API integration.",
            fork: false,
            stars: 123
        )
    )
}
