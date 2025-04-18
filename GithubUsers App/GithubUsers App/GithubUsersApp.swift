//
//  GithubUsers_AppApp.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import SwiftUI

@main
struct GithubUsersApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbarBackground(Color.blue, for: .navigationBar)
                    .toolbarColorScheme(.dark, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
            }
        }
    }
}
