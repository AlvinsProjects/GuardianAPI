//
//  ArticleRow.swift
//  NewsAPI
//
//  Created by Alvin Alleyne on 11/21/25.
//

import SwiftUI



struct ArticleRow: View {

    var vm: ContentView.ArticleListViewModel

    private var thumbSize: CGFloat {
        #if targetEnvironment(macCatalyst)
        200
        #else
        80
        #endif
    }

    private var sectionFont: Font {
        #if targetEnvironment(macCatalyst)
//        .headline
        .title3
        #else
        .footnote
        #endif
    }

    private var titleFont: Font {
        #if targetEnvironment(macCatalyst)
        .title3
        #else
        .headline
        #endif
    }

    private var metaFont: Font {
        #if targetEnvironment(macCatalyst)
//        .headline
        .title3
        #else
        .footnote
        #endif
    }

    var body: some View {
        Form {
            ForEach(vm.filteredArticles.enumerated(), id: \.element.id) { offset, article in
                VStack(alignment: .leading) {
                    HStack(spacing: 8) {
                        if let thumbnail = article.fields.thumbnail,
                           let thumbURL = URL(string: thumbnail) {
                            AsyncImage(url: thumbURL) { phase in
                                switch phase {
                                    case .empty:
                                        ProgressView()
                                            .frame(width: thumbSize, height: thumbSize)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: thumbSize, height: thumbSize)
                                            .clipShape(.rect(cornerRadius: 10))
                                    case .failure:
                                        Image(systemName: "photo")
                                            .frame(width: thumbSize, height: thumbSize)
                                    @unknown default:
                                        EmptyView()
                                }
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("\(offset + 1). \(article.sectionName)")
                                .font(sectionFont)
                                .foregroundStyle(Color(.pink))
                                .fontWeight(.heavy)

                            Text(article.webTitle)
                                .font(titleFont)
                                .fontWeight(.medium)
                        }
                    }
                    HStack {
                        Text("\(article.webPublicationDate, style: .date):")
                        Text("Age: \(article.webPublicationDate, style: .relative)")
                            .foregroundStyle(.red).opacity(0.8)

                        Spacer()

                        if let url = URL(string: article.webUrl) {
                            Link("Read article", destination: url)
                        }
                    }
                    .font(metaFont)
                    .foregroundStyle(.blue)
                    .bold()
                }
            }
        }
    }
}


