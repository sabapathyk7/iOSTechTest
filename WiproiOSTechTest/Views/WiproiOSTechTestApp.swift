//
//  WiproiOSTechTestApp.swift
//  WiproiOSTechTest
//
//  Created by kanagasabapathy on 18/10/23.
//

import SwiftUI

@main
struct WiproiOSTechTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: QuoteViewModel(quoteListRepo: QuoteListRepository(networkManager: NetworkManager())), isErrorOccured: false)
        }
    }
}
