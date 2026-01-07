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
            // "enumerated" creates a tuple with the offset (index no) and the article
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
                        // Display list number and category (sectionName)
                        VStack(alignment: .leading) {
                            Text("\(offset + 1). \(article.sectionName)")
                                .font(.footnote)
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
                            .foregroundStyle(.red)
                        
                        Spacer()
                        
                        // Link the selected item to the appropriate webURL
                        if let url = URL(string: article.webURL) {
                            Link("Read article", destination: url)
                        }
                    }
                    .font(.footnote)
                    .foregroundStyle(.blue)
                    .bold(true)
                }
            }
        }
    }
}


//#Preview {
//    ArticleRow(vm: vm)
//}








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



