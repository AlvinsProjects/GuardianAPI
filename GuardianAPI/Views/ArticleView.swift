//
//  ArticleView.swift
//  NewsAPI
//
//  Created by Alvin Alleyne on 11/14/25.
//

import SwiftUI

struct ArticleView: View {
    
    var article: Article
    
    var body: some View {
        ScrollView {
            
//            if let url = URL(string: article.urlToImage ?? "") {
//                ArticleImage(imageURL: url)
//            } else if let placeholder = URL(string: "https://via.placeholder.com/300") {
//                ArticleImage(imageURL: placeholder)
//            }
            
//            VStack(alignment: .leading, spacing: 10) {
//                Text(article.title)
//                    .font(.title)
//                
//                Text(article.description ?? "Error: No description available.")
//                    .font(.headline)
//                
//                Text(article.publishedAt)  // Date
//                
//                Divider()
//                Text(article.content ?? "Error: No description available.")
//            }
//            .padding(.horizontal)
        }
//        .frame(maxWidth: 600)    //restrict iPad width
//        .navigationTitle(Text(article.title))
//        .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    ArticleView(article: .example)
}

