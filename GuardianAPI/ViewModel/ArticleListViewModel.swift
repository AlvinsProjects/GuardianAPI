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
            
            //set up parameters
            let searchKeyword = "news" //Cricket%20OR%20Ashes"
            let dataFormat    = "json"
            let section       = "sport"
            let fromDate      = "2025-12-01"
            let toDate        = "2025-12-30"
            let page          = 1
            let pageSize      = 29
            let orderBy       = "newest"
            let productionOffice = "uk"
            let lang          = "en"
            
            // Search for the latest cricket (Ashes) news - using the fields defined above
            let apiUrlString = "\(baseUrl)search?q=\(searchKeyword)&format=\(dataFormat)&section=\(section)&from-date=\(fromDate)&to-date=\(toDate)&page=\(page)&page-size=\(pageSize)&order-by=\(orderBy)&production-office=\(productionOffice)&lang=\(lang)&show-fields=thumbnail&api-key=\(apiKey)"

            // Search for the latest cricket (Ashes) news
            let apiUrlString2 = "https://content.guardianapis.com/search?q=Cricket%20OR%20Ashes&format=json&section=sport&from-date=2025-12-01&to-date=2025-12-30&page=1&page-size=29&order-by=newest&production-office=uk&lang=en&show-fields=thumbnail,headline,short-url,webPublicationDate,sectionName,webTitle,apiURL,isHosted&api-key=f9108003-c02d-4f9e-bfc4-3f501a618e6b"
            
            // Search for the latest news items - any subject
            let apiUrlString3 = "https://content.guardianapis.com/search?q=news&format=json&page=1&page-size=29&order-by=newest&production-office=uk&lang=en&show-fields=thumbnail&api-key=f9108003-c02d-4f9e-bfc4-3f501a618e6b"
            

            do {
                let url = URL(string: apiUrlString3)!
                let session = URLSession(configuration: .ephemeral)
                let (data, _) = try await session.data(from: url)
                let decoder = JSONDecoder()
                // If you switch publishedAt to Date in the future:
                decoder.dateDecodingStrategy = .iso8601
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
 News     : UK,  US politics, World, Climate crisis, Middle East, Ukraine, US Immigration, Soccer, Business, Environment, Tech, Science, Newsletters, Wellness
 
 Opinion  : The Guardian view, Columnists, Letters, Opinion videos, Cartoons,
 
 Sport    : Football, Cricket, Rugby Union, Tennis, Cycling, F1, Boxing, Rugby League, Racing, US sports
 
 Culture  : Film, Music, TV & Radio, Books, Art & design, Stage, Games, Classical
 
 Lifestyle: The Filter, Fashion, Food, Recipes, Travel, Health & Fitness, Women, Men, Love & sex, Beauty, Home & garden
 
 */











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
