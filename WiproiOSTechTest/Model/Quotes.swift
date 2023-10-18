//
//  Quotes.swift
//  WiproiOSTechTest
//
//  Created by kanagasabapathy on 18/10/23.
//

import Foundation

// MARK: - QuoteData
struct QuoteData: Codable {
    let page: Int
    let lastPage: Bool
    let quotes: [Quote]

    enum CodingKeys: String, CodingKey {
        case page
        case lastPage = "last_page"
        case quotes
    }
}

// MARK: - Quote
struct Quote: Codable, Identifiable {
    let id: Int
    let dialogue, quotePrivate: Bool
    let tags: [String]
    let url: String
    let favoritesCount, upvotesCount, downvotesCount: Int
    let author, authorPermalink, body: String
    let source: String?
    let context: String?

    enum CodingKeys: String, CodingKey {
        case id, dialogue
        case quotePrivate = "private"
        case tags, url
        case favoritesCount = "favorites_count"
        case upvotesCount = "upvotes_count"
        case downvotesCount = "downvotes_count"
        case author
        case authorPermalink = "author_permalink"
        case body, source, context
    }
}

struct TableViewData: Equatable, Identifiable, Hashable, Decodable {
    var id = UUID()
    var quoteAuthor: String
    var quoteUpVoteCount: Int
    var quoteFavCount: Int
    var quoteBody: String
    var quoteAuthorPermaLink: String
}
