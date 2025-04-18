//
//  HomeViewModel_Tests.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import XCTest
import Combine
@testable import GithubUsers_App

class HomeViewModel_Tests: XCTestCase {
    var viewModel: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = HomeViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchUsersWithSuccess() async {
        // Prepare a valid username to search for
        let username = "meetahmed"
        
        // Fetch users
        await viewModel.fetchUsers(for: username)
        
        // Assert that the users list is populated
        XCTAssertFalse(viewModel.isLoading) // Loading should stop after fetch
        XCTAssertGreaterThan(viewModel.users.count, 0) // There should be at least one user
    }
}
