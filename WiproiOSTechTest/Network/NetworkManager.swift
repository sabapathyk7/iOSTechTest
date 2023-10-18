//
//  NetworkManager.swift
//  LBG_Virtusa-iOSTechTest
//
//  Created by kanagasabapathy on 13/10/23.
//

import Foundation

protocol Networkable {
    func fetchDataFromURL(url: URL) async throws -> Data
}

class NetworkManager: Networkable {
    func fetchDataFromURL(url: URL) async throws -> Data {
        do {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("Bearer \(EndPoint.accessKey)", forHTTPHeaderField: "Authorization")
            let(data, response) = try await URLSession.shared.data(for: request)
            print(response)
            return data
        } catch {
            throw NetworkError.badUrl
        }
    }
}
