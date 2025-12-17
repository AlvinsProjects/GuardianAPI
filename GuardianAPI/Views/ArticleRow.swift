//
//  ArticleRow.swift
//  NewsAPI
//
//  Created by Alvin Alleyne on 11/21/25.
//

import SwiftUI

struct ArticleRow: View {
    
    var article: Article
    
    var body: some View {
        NavigationLink(value: article) {
            
            HStack {
//                if let url = URL(string: article.urlToImage ?? "") {
//                    ArticleImage(imageURL: url)
//                        .frame(width: 80, height: 80)
//                        .clipShape(.rect(cornerRadius: 10))
//                } else if let placeholder = URL(string: "https://via.placeholder.com/300") {
//                    ArticleImage(imageURL: placeholder)
//                }
//                
//                Text(article.title)
//                    .foregroundStyle(.black)
            }
        }
    }
}


#Preview {
    ArticleRow(article: .example)
}
