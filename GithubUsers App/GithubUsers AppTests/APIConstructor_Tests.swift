//
//  APIConstructor_Tests.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import XCTest
@testable import GithubUsers_App

class APIConstructorTests: XCTestCase {
    func testAPIConstructorForUserDetails() {
        let username = "meetahmed"
        let endpoint = FetchUserDetailsEndpoint(username: username)
        
        let apiConstructor = APIConstructorImpl(endpoint: endpoint)
        
        // Assert that the generated URL is correct
        let url = apiConstructor.endpoint.url
        XCTAssertEqual(url, "https://api.github.com/users/\(username)")
    }
    
    func testAPIConstructorForUserRepos() {
        let username = "meetahmed"
        let endpoint = FetchUserReposEndpoint(username: username)
        
        let apiConstructor = APIConstructorImpl(endpoint: endpoint)
        
        // Assert that the generated URL is correct
        let url = apiConstructor.endpoint.url
        XCTAssertEqual(url, "https://api.github.com/users/\(username)/repos")
    }
}
