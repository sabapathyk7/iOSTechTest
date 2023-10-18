//
//  QuoteRowView.swift
//  WiproiOSTechTest
//
//  Created by kanagasabapathy on 18/10/23.
//

import SwiftUI

struct QuoteRowView: View {
    @State var tableViewData: TableViewData
    var body: some View {
        HStack(alignment: .bottom) {
          VStack(alignment: .leading) {
              Text(tableViewData.quoteAuthor).font(.title3).bold()
              Text(tableViewData.quoteAuthorPermaLink).font(.subheadline)
          }
          Spacer()
          Text("Vote \(String(tableViewData.quoteUpVoteCount))").font(.headline)
        }
        .padding()
    }
}

#Preview {
    QuoteRowView(tableViewData: TableViewData(quoteAuthor: "Lewis Carroll", quoteUpVoteCount: 1, quoteFavCount: 1, quoteBody: "Who in the world am I? Ah, that's the great puzzle.", quoteAuthorPermaLink: "lewis-carroll"))
}
