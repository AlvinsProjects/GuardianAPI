//
//  ArticleRow.swift
//  NewsAPI
//
//  Created by Alvin Alleyne on 11/21/25.
//

import SwiftUI



struct ArticleRow: View {
    
    var vm: ContentView.ArticleListViewModel
//    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        Form {
            // "enumerated" creates a tuple with the offset (index no) and the article
//            if sizeClass == .compact {
                ForEach(vm.filteredArticles.enumerated(), id: \.offset) { offset, article in
                    VStack(alignment: .leading) {
                        HStack(spacing: 8) {
                            // load and display the thumbnail
                            if let thumbURL = URL(string: article.fields.thumbnail) {
                                AsyncImage(url: thumbURL) { phase in
                                    switch phase {
                                        case .empty:
                                            ProgressView()
                                                .frame(width: 80, height: 80)
                                        case .success(let image):
                                            //  if sizeClass == .compact {
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 80, height: 80)
                                                .clipShape(.rect(cornerRadius: 10))
                                            //   }
                                        case .failure:
                                            Image(systemName: "photo")
                                                .frame(width: 80, height: 80)
                                        @unknown default:
                                            EmptyView()
                                    }
                                }
                            }
                            // Display list number and category (sectionName)
                            VStack(alignment: .leading) {
                                Text("\(offset + 1). \(article.sectionName)")
                                    .font(.footnote)
                                    .foregroundStyle(Color(.pink))
                                    .fontWeight(.heavy)
                                
                                // Display the item title
                                Text(article.webTitle)
                                    .font(.headline)
                                    .fontWeight(.medium)
                            }
                        }
                        HStack {
                            // Date and time at the bottom left of each list item
                            Text("\(article.webPublicationDate, style: .date):")
                            Text("Age: \(article.webPublicationDate, style: .relative)")
                                .foregroundStyle(.red).opacity(0.8)
                            
                            Spacer()
                            
                            // Link the selected item to the appropriate webURL
                            if let url = URL(string: article.webUrl) {
                                Link("Read article", destination: url)
                            }
                        }
                        .font(.footnote)
                        .foregroundStyle(.blue)
                        .bold(true)
                    }
                }
//            } else {
//                Text("No articles to display.")
//                    .font(Font.largeTitle.bold())
//            }
        }
    }
}




#Preview {
    // Use the nested type if ArticleListViewModel lives inside ContentView
//    ArticleRow(vm: ContentView.ArticleListViewModel.example.0)
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




