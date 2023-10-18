//
//  MockNetworkManagerTests.swift
//  WiproiOSTechTestTests
//
//  Created by kanagasabapathy on 18/10/23.
//

import Foundation
@testable import WiproiOSTechTest
import XCTest

class MockNetworkManagerTests: XCTestCase {
    func testFetchDataFromURLSuccessCase() async throws {
        let mockNetworkManager = MockNetworkManager()
        let repo = QuoteListRepository(networkManager: mockNetworkManager)
        let urlString = "quoteData"
        if let url = URL(string: urlString)  {
            let data = try await repo.fetchQuoteList(for: url)
            XCTAssertNotNil(data, "Data Should not be nil")
        }
    }
    func testFetchDataFromURLInvalidCase() async throws {
        let mockNetworkManager = MockNetworkManager()
        let repo = QuoteListRepository(networkManager: mockNetworkManager)
        let urlString = "invalidquoteData"
        guard let url = URL(string: urlString) else {
            return XCTFail("Expected Error - URL String not exists")
        }

        do {
            _ = try await repo.fetchQuoteList(for: url)
            XCTFail("Expected Error")
        } catch let error as NetworkError {
            XCTAssertEqual(error, NetworkError.badUrl, "Error should be dataNotFound")
        } catch {
            XCTFail("Error: \(error)")
        }
    }
}
