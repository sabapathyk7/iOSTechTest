//
//  ContentView.swift
//  WiproiOSTechTest
//
//  Created by kanagasabapathy on 18/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: QuoteViewModel
    @State var isErrorOccured: Bool

    var body: some View {
        NavigationStack{
            VStack {
                if viewModel.error != nil {
                    ProgressView().alert(isPresented: $isErrorOccured){
                        Alert(title: Text(viewModel.error?.localizedDescription ?? "Error Occured"),message: Text("Something went wrong"),
                              dismissButton: .default(Text("Ok")))
                    }
                } else {
                    Text("Quotes").font(.title).bold()
                    List{
                        ForEach(viewModel.quotes){ quote in
                            NavigationLink{
                                QuoteDetailView(tableViewData: TableViewData(quoteAuthor: quote.author, quoteUpVoteCount: quote.upvotesCount, quoteFavCount: quote.favoritesCount, quoteBody: quote.body, quoteAuthorPermaLink: quote.authorPermalink))
                            }label: {
                                QuoteRowView(tableViewData: TableViewData(quoteAuthor: quote.author, quoteUpVoteCount: quote.upvotesCount, quoteFavCount: quote.favoritesCount, quoteBody: quote.body, quoteAuthorPermaLink: quote.authorPermalink))
                            }
                        }

                    }.padding()
                }
            }.task {
                await viewModel.fetchDataForQuotes(baseURL: EndPoint.baseURL, subURL: "")
                if viewModel.error != nil{
                    isErrorOccured = true
                }
            }.refreshable {
                await viewModel.fetchDataForQuotes(baseURL: EndPoint.baseURL, subURL: "")
                if viewModel.error != nil{
                    isErrorOccured = true
                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: QuoteViewModel(quoteListRepo: QuoteListRepository(networkManager: NetworkManager())), isErrorOccured: false)
}
