//
//  ContentView.swift
//  GuardianAPI
//
//  Created by Alvin Alleyne on 12/8/25.
//

import SwiftUI


struct ContentView: View {
    
    @State private var vm = ArticleListViewModel()
    var apiUrlString: String
    
    var body: some View {
        NavigationStack {
            switch vm.loadState {
                case .failed:
                    LoadFailedView(error: vm.loadError, retry: vm.loadArticles)
                    
                default:
                    ArticleRow(vm: vm)
                        .navigationTitle(apiUrlString)
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
        .navigationTitle(Text("KKKKK"))
    }
}



#Preview {
//    ContentView(apiUrlString: "hello")
    ContentView(apiUrlString: "Hello World")
}

