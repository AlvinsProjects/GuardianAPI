//
//  ArticleImage.swift
//  NewsAPI
//
//  Created by Alvin Alleyne on 11/21/25.
//

import SwiftUI

struct ArticleImage: View {
    
    var imageURL: URL
    
    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                default:
                    Image(systemName: "newspaper")
                    
            }
        }
    }
}



#Preview {
//    ArticleImage(imageURL: URL(string: Article.example.url)!)
}
