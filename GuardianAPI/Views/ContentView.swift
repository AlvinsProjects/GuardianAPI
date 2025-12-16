//
//  ContentView.swift
//  GuardianAPI
//
//  Created by Alvin Alleyne on 12/8/25.
//

import SwiftUI


struct ContentView: View {
    
//    @StateObject private var viewModel = ArticleListViewModel()
    
//    var body: some View {
//        NavigationStack {
            
            var viewModel = ArticleListViewModel()
            
            var body: some View {
//                NavigationStack {
//                    List(viewModel.articles) { article in
//                        VStack(alignment: .leading) {
//                            Text(article.webTitle)
//                                .font(.headline)
//                            // Add link to the full article
//                            Link("Read full article", destination: URL(string: article.webUrl)!)
//                                .font(.subheadline)
//                                .foregroundColor(.blue)
//                        }
//                    }
//                    .navigationTitle("Guardian News")
//                }
                // Use the new async/await syntax to call the fetching function
//                .task {
//                    await viewModel.fetchArticles()
//                }
            }
            
//            switch viewModel.loadState {
//                case .failed:
//                    LoadFailedView(error: viewModel.loadError, retry: viewModel.loadArticles)
//                default:
//                    if viewModel.articles.isEmpty {
//                        ProgressView("Loading...")
//                            .controlSize(.extraLarge)
//                    } else {
//                        List(viewModel.filteredArticles, rowContent: ArticleRow.init)
//                            .navigationTitle("NewsAPI")
//                            .navigationDestination(for: Article.self,
//                                                   destination: ArticleView.init)
//                            .refreshable(action: viewModel.loadArticles)
//                            .searchable(text: $viewModel.filterText,
//                                        placement: .automatic,
//                                        prompt: "Filter articles")
//                    }
//            }
//        }
//        .task(viewModel.loadArticles)
    }
//}



#Preview {
    ContentView()
}
