//
//  QuoteListRepository.swift
//  WiproiOSTechTest
//
//  Created by kanagasabapathy on 18/10/23.
//

import Foundation

final class QuoteListRepository: QuoteRepository {
    let networkManager: Networkable
    init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
    func fetchQuoteList(for url: URL) async throws -> QuoteData {
        let data = try await self.networkManager.fetchDataFromURL(url: url)
        let quoteData = try JSONDecoder().decode(QuoteData.self, from: data)
        return quoteData
    }
}
