//
//  DetailsViewModel_Tests.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import XCTest
import Combine
@testable import GithubUsers_App

class DetailsViewModel_Tests: XCTestCase {
    var viewModel: DetailsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = DetailsViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    // Test fetching user details and repositories for a valid username
    func testFetchUserDetailsAndReposSuccess() async {
        let username = "meetahmed"
        
        await viewModel.fetchData(username: username)
        
        // Assert that user details are fetched
        XCTAssertNotNil(viewModel.user)
        XCTAssertEqual(viewModel.user?.login.lowercased(), username)
        
        // Assert that repositories are fetched
        XCTAssertGreaterThan(viewModel.repos.count, 0)
    }
}
