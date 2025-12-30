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
                    ArticleRow(vm: vm)
                    
                        .navigationTitle("Guardian News")
                        .refreshable {
                            await vm.loadArticles()
                        }
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



#Preview {
    ContentView()
}

