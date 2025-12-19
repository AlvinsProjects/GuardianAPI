//
//  ContentView.swift
//  GuardianAPI
//
//  Created by Alvin Alleyne on 12/8/25.
//

import SwiftUI


struct ContentView: View {
    
    @State private var vm = ArticleListViewModel()
    
    var body: some View {
        
        NavigationStack {
            switch vm.loadState {
                case .failed:
                    LoadFailedView(error: vm.loadError, retry: vm.loadArticles)
                default:
//                    if vm.articles.isEmpty {
//                        Text(verbatim: String(vm.articles.isEmpty))
//                        ProgressView("Loading....")
//                            .controlSize(.extraLarge)
//                    } else {
                    
                    List(vm.filteredArticles, id: \.id) { article in
                        VStack(alignment: .leading, spacing: 4) {
                            Text("⚠️\(article.sectionName)")
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
                    .refreshable(action: vm.loadArticles)
                    .searchable(text: $vm.filterText,
                                placement: .automatic,
                                prompt: "Filter articles")
                    
                    .task {
                        await vm.loadArticles()
                    }
            }
        }
    }
}
//}





//            switch vm.loadState {
//                case .failed:
//                    LoadFailedView(error: vm.loadError, retry: vm.loadArticles)
//                default:
//                    if vm.articles.isEmpty {
//                        ProgressView("Loading...")
//                            .controlSize(.extraLarge)
//                    } else {
//                        List(vm.filteredArticles, rowContent: ArticleRow.init)
//                            .navigationTitle("NewsAPI")
//                            .navigationDestination(for: Article.self,
//                                                   destination: ArticleView.init)
//                            .refreshable(action: vm.loadArticles)
//                            .searchable(text: $vm.filterText,
//                                        placement: .automatic,
//                                        prompt: "Filter articles")
//                    }
//            }
//            
//        }
//        .task {
//            await vm.loadArticles()
//        }


//
//#Preview {
//    ContentView()
//}


