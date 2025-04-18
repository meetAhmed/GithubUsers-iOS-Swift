//
//  NetworkService_Tests.swift
//  GithubUsers App
//
//  Created by Ahmed Ali on 18/04/2025.
//

import XCTest
@testable import GithubUsers_App

class NetworkService_Tests: XCTestCase {
    var service: NetworkService!
    
    override func setUp() {
        super.setUp()
        service = NetworkServiceImpl(urlSession: URLSession.shared)
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    // Test for fetching data from a real API endpoint
    func testFetchDataSuccess() async {
        let endpoint = FetchUserDetailsEndpoint(username: "meetahmed")
        
        // Fetch the data
        do {
            let response: Data = try await service.fetchData(api: APIConstructorImpl(endpoint: endpoint))
            
            // Assert that the response is not empty
            XCTAssertGreaterThan(response.count, 0)
        } catch {
            XCTFail("Expected success but got error: \(error)")
        }
    }
    
    // Test for invalid API endpoint
    func testFetchDataFailure() async {
        // Prepare an invalid endpoint
        let endpoint = FetchUserDetailsEndpoint(username: "")
        
        // Fetch the data
        do {
            _ = try await service.fetchData(api: APIConstructorImpl(endpoint: endpoint))
            XCTFail("Expected failure but got success")
        } catch {
            // Assert that an error is thrown
            XCTAssertNotNil(error)
        }
    }
}
