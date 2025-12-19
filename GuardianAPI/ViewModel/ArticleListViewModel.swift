//
//  ViewModel.swift
//  NewsAPI
//
//  Created by Alvin Alleyne on 11/21/25.
//


import SwiftUI


extension ContentView {
    
    enum LoadState {
        case loading, loaded, failed
    }
    
    
    @Observable @MainActor
    class ArticleListViewModel {
        
        private(set) var articles = [Article]()
        private(set) var loadState = LoadState.loading
        private(set) var loadError: (any Error)?
        
        var filterText = ""
        
        var filteredArticles: [Article] {
            if filterText.isEmpty {
                articles
            } else {
                articles.filter {
                    $0.webTitle.localizedStandardContains(filterText) }
            }
        }
        
        
        func loadArticles() async {
            loadState = .loading
            do {
                let url = URL(string: "https://content.guardianapis.com/search?page=3&q=news&api-key=f9108003-c02d-4f9e-bfc4-3f501a618e6b")!
                let session = URLSession(configuration: .ephemeral)
                let (data, _) = try await session.data(from: url)
                let decoder = JSONDecoder()
                // If you switch publishedAt to Date in the future:
                decoder.dateDecodingStrategy = .iso8601
                
                let decodedResponse = try decoder.decode(GuardianResponse.self, from: data)
                articles = decodedResponse.response.results //.filter({ $0.sectionName != "Comment is closed" })
                loadState = .loaded
            } catch {
                print(error.localizedDescription)
                loadState = .failed
                loadError = error
            }
        }
    }
}






//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print(json)



//                } catch let DecodingError.dataCorrupted(context) {
//                    print("Data corrupted:", context.debugDescription, context.codingPath)
//                } catch let DecodingError.keyNotFound(key, context) {
//                    print("Key not found:", key, context.debugDescription, context.codingPath)
//                } catch let DecodingError.typeMismatch(type, context) {
//                    print("Type mismatch:", type, context.debugDescription, context.codingPath)
//                } catch let DecodingError.valueNotFound(value, context) {
//                    print("Value not found:", value, context.debugDescription, context.codingPath)
//                } catch {
//                    print("Other error:", error)
//                }
