//
//  ArticleRow.swift
//  NewsAPI
//
//  Created by Alvin Alleyne on 11/21/25.
//

import SwiftUI



struct ArticleRow: View {
    
    var vm: ContentView.ArticleListViewModel
    
    var body: some View {
        List {
            ForEach(vm.filteredArticles, id: \.id) { article in
                VStack(alignment: .leading) {
                    HStack(spacing: 8) {
                        if let thumbURL = URL(string: article.fields.thumbnail) {
                            AsyncImage(url: thumbURL) { phase in
                                switch phase {
                                    case .empty:
                                        ProgressView()
                                            .frame(width: 80, height: 80)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                            .clipShape(.rect(cornerRadius: 10))
                                    case .failure:
                                        Image(systemName: "photo")
                                            .frame(width: 80, height: 80)
                                    @unknown default:
                                        EmptyView()
                                }
                            }
                        }
                        Text(article.webTitle)
                            .font(.headline)
                    }
                    HStack {
                        Text(article.webPublicationDate, style: .date)
                            .font(.footnote).bold()
                        
                        Spacer()
                        
                        if let url = URL(string: article.webURL) {
                            Link("Read full article", destination: url)
                                .font(.subheadline)
                                .foregroundStyle(.blue)
                        }
                    }
                }
            }
        }
    }
}




//        NavigationLink(value: article) {
//            
//            HStack {
//                if let url = URL(string: article.urlToImage ?? "") {
//                    ArticleImage(imageURL: url)
//                        .frame(width: 80, height: 80)
//                        .clipShape(.rect(cornerRadius: 10))
//                } else if let placeholder = URL(string: "https://via.placeholder.com/300") {
//                    ArticleImage(imageURL: placeholder)
//                }
                
//                Text(article.sectionName)
//                    .foregroundStyle(.black)
//            }
//        }
//    }
//}


//#Preview {
//    ArticleRow(article: Article.example)
//}
