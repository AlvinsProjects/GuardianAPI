//
//  ContentView.swift
//  GuardianAPI
//
//  Created by Alvin Alleyne on 12/8/25.
//

import SwiftUI


struct ContentView: View {
    
    @State private var vm = ArticleListViewModel()
    var apiUrlCategory: String

    var body: some View {
        NavigationStack {
            switch vm.loadState {
                case .failed:
                    LoadFailedView(error: vm.loadError, retry: { await vm.loadArticles(apiUrlStrings: apiUrlCategory) })
                    
                default:
                    ArticleRow(vm: vm)
                        .navigationTitle(apiUrlCategory)
                        .refreshable {
                            await vm.loadArticles(apiUrlStrings: apiUrlCategory)
                        }
                    
                        .searchable(text: $vm.filterText,
                                    placement: .automatic,
                                    prompt: "Filter articles")
                    
                        .task {
                            await vm.loadArticles(apiUrlStrings: apiUrlCategory)
                        }
            }
        }
        .navigationTitle(Text("Error Reading API"))
        .preferredColorScheme(ColorScheme.dark)
    }
}



#Preview {
    ContentView(apiUrlCategory: "World News")
}

