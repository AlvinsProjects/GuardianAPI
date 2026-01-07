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
                    // localizedStandardContains search is locale-aware, case and diacritic insensitive.
                    $0.webTitle.localizedStandardContains(filterText) }
            }
        }
        
        
        func loadArticles() async {
            loadState = .loading
            
            // set up my API Key
            let apiKey = "f9108003-c02d-4f9e-bfc4-3f501a618e6b"
            
            // set up base url
            let baseUrl = "https://content.guardianapis.com/"

            //MARK: GENERAL NEWS
            let apiUrlString1 = "\(baseUrl)search?section=world&&format=json&page=1&page-size=40&order-by=newest&lang=en&show-fields=thumbnail,headline,short-url,webPublicationDate,sectionName,webTitle,apiURL&api-key=\(apiKey)"
            
            
            //MARK: CRICKET
            // Search for the latest cricket (Ashes) news - using the fields defined above
            let apiUrlString2 = "\(baseUrl)search?q=Cricket&format=json&section=sport&page=1&page-size=40&order-by=newest&lang=en&show-fields=thumbnail&api-key=\(apiKey)"

            //MARK: TENNIS
            // Search for the latest TENNIS news:
            let apiUrlString3 = "\(baseUrl)search?q=tennis&format=json&section=sport&page=1&page-size=40&order-by=newest&lang=en&show-fields=thumbnail,headline,short-url,webPublicationDate,sectionName,webTitle,apiURL,isHosted&api-key=\(apiKey)"
            
            //MARK: RUGBY
            // Search for the latest RUGBY items - any subject.
            let apiUrlString4 = "\(baseUrl)search?q=rugby&format=json&section=sport&&page=1&page-size=40&order-by=newest&lang=en&show-fields=headline,short-url,thumbnail,webPublicationDate,sectionName,webTitle,apiURL,isHosted&api-key=\(apiKey)"
            
            

            
            do {
                let url = URL(string: apiUrlString1)!
                let session = URLSession(configuration: .default)
                let (data, _) = try await session.data(from: url)
                let decoder = JSONDecoder()
                // If you switch publishedAt to Date in the future:
                decoder.dateDecodingStrategy = .iso8601
                
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
                
                let decodedResponse = try decoder.decode(GuardianResponse.self, from: data)
                articles = decodedResponse.response.results
                loadState = .loaded
            } catch {
                print(error.localizedDescription)
                loadState = .failed
                loadError = error
            }
        }
    }
}




//MARK: THE FOLLOWING ARE 5 CATEGORIES AND THEIR SUB-HEADINGS AVAILABLE ON THE GUARDIAN
/*
 News     : UK,  US politics, World, Climate crisis, Middle East, Ukraine, US Immigration, Soccer, Business, Environment, Tech, Science,    Newsletters, Wellness
 
 Opinion  : The Guardian view, Columnists, Letters, Opinion videos, Cartoons,
 
 Sport    : Football, Cricket, Rugby Union, Tennis, Cycling, F1, Boxing, Rugby League, Racing, US sports
 
 Culture  : Film, Music, TV & Radio, Books, Art & design, Stage, Games, Classical
 
 Lifestyle: The Filter, Fashion, Food, Recipes, Travel, Health & Fitness, Women, Men, Love & sex, Beauty, Home & garden
 
 */











//let json = try JSONSerialization.jsonObject(with: data, options: [])
//print(json)

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





//set up parameters
//            let content       = "Cricket%20OR%20Rugby"
//            let dataFormat    = "json"
//            let section       = "sport"
//            let fromDate      = "2025-12-01"
//            let toDate        = "2026-01-06"
//            let page          = 1
//            let pageSize      = 40
//            let orderBy       = "newest"
//            let productionOffice = "uk"
//            let lang          = "en"
