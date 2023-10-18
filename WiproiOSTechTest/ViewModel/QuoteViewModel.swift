//
//  QuoteViewModel.swift
//  WiproiOSTechTest
//
//  Created by kanagasabapathy on 18/10/23.
//

import Foundation

@MainActor class QuoteViewModel: ObservableObject {
    @Published var quotes: [Quote] = []
    @Published var error: NetworkError?
    private let quoteListRepo: QuoteListRepository
    init(quoteListRepo: QuoteListRepository) {
        self.quoteListRepo = quoteListRepo
    }
}

extension QuoteViewModel {
    func fetchDataForQuotes(baseURL: String, subURL: String) async {
        let urlString = baseURL + subURL
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.error = .badUrl
            }
            return
        }
        do {
            let quoteData = try await quoteListRepo.fetchQuoteList(for: url)
            quotes = quoteData.quotes
            error = nil

        } catch {
            self.error = .generic
        }
    }
}
