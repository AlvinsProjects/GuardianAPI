//
//  ContentView.swift
//  GuardianAPI
//
//  Created by Alvin Alleyne on 12/8/25.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject private var vm = ArticleListViewModel()
    
    var body: some View {
        NavigationStack {
            
            List(vm.articles, id: \.id) { article in
                VStack(alignment: .leading, spacing: 4) {
                    Text(article.sectionName)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    Text(article.webTitle)
                        .font(.headline)
                    
                    if let url = URL(string: article.webURL) {
                        Link("Read full article", destination: url)
                            .font(.subheadline)
                            .foregroundStyle(.blue)
                    }
                }
            }
            .navigationTitle("Guardian News")
        }
        
        // Use the new async/await syntax to call the fetching function
        .task {
            await vm.loadArticles()
        }
        //    }
        
        
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
        //        }
        //        }
//            .task { await viewModel.loadArticles() }
        //    }
    }
}



#Preview {
    ContentView()
}

