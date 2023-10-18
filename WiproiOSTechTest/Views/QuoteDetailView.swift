//
//  QuoteDetailView.swift
//  WiproiOSTechTest
//
//  Created by kanagasabapathy on 18/10/23.
//

import SwiftUI

struct QuoteDetailView: View {
    @State var tableViewData: TableViewData
    var body: some View {
        Spacer()
        VStack (alignment: .center, content: {
            Text(tableViewData.quoteAuthor)
                .foregroundColor(.gray)
                .font(.title).bold()
            let stars = HStack(spacing: 0) {
                ForEach(0..<tableViewData.quoteFavCount, id: \.self) { _ in
                    Image(systemName: "star.fill").resizable().aspectRatio(contentMode: .fit)
                }
            }

                stars.overlay {
                GeometryReader { geometry in
                    let width = 3.8 / CGFloat(5.0) * geometry.size.width
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: width)
                            .foregroundColor(.yellow)
                    }
                }.mask(stars)
            }.frame(width: 20, alignment: .center)
            Divider()
            Text(tableViewData.quoteBody.description).font(.subheadline).bold()
        })
        Spacer()
    }
}

#Preview {
    QuoteDetailView(tableViewData: TableViewData(quoteAuthor: "Lewis Carroll", quoteUpVoteCount: 1, quoteFavCount: 1, quoteBody: "Who in the world am I? Ah, that's the great puzzle.", quoteAuthorPermaLink: "lewis-carroll"))
}
