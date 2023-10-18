//
//  QuoteRepository.swift
//  WiproiOSTechTest
//
//  Created by kanagasabapathy on 18/10/23.
//

import Foundation

protocol QuoteRepository {
    func fetchQuoteList(for url: URL) async throws -> QuoteData
}
