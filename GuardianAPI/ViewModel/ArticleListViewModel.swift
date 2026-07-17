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
                    /*
                     "localizedStandardContains" search is locale-aware,
                     case and diacritic insensitive.  */
                    $0.webTitle.localizedStandardContains(filterText)
                }
            }
        }
        
        
        func loadArticles(apiUrlStrings: String) async {
            loadState = .loading

            guard let urlString = getApiUrl(category: apiUrlStrings),
                  let url = URL(string: urlString) else {
                loadState = .failed
                loadError = FetchError.unknownCategory(apiUrlStrings)
                return
            }

            do {
                let session = URLSession(configuration: .default)
                let (data, _) = try await session.data(from: url)
                let decoder = JSONDecoder()
                // If you switch publishedAt to Date in the future:
                decoder.dateDecodingStrategy = .iso8601
                
                //MARK: following prints the decoded data
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
        
        
        
        // Returns a Guardian API URL string for the given category, or nil for unknown categories.
        func getApiUrl(category: String) -> String? {
            
            // TODO: Move apiKey to a git-ignored Secrets.xcconfig and read via Bundle.main.infoDictionary
            let baseUrl    = "https://content.guardianapis.com/"
            let apiKey     = "f9108003-c02d-4f9e-bfc4-3f501a618e6b"
            let formatPage = "format=json&page=1&page-size=40&order-by=newest&lang=en"
            let showFields = "show-fields=thumbnail,headline,short-url,webPublicationDate,sectionName,webTitle,apiURL"

            switch category {
                case "World News":
                    return "\(baseUrl)search?q=news&section=world&" +
                    "\(formatPage)&\(showFields)&api-key=\(apiKey)"

                case "US News":
                    return "\(baseUrl)search?section=us-news&" +
                    "\(formatPage)&\(showFields)&api-key=\(apiKey)"

                case "UK News":
                    return "\(baseUrl)search?section=uk-news&" +
                    "\(formatPage)&\(showFields)&api-key=\(apiKey)"
                    
                case "Australia News":
                    return "\(baseUrl)search?q=Australia-News&" +
                    "\(formatPage)&\(showFields)&api-key=\(apiKey)"
                    
                case "Cricket":
                    return "\(baseUrl)search?q=cricket&section=sport&" +
                    "\(formatPage)&\(showFields)&api-key=\(apiKey)"

                case "Tennis":
                    return "\(baseUrl)search?q=tennis&section=sport&" +
                    "\(formatPage)&\(showFields)&api-key=\(apiKey)"

                case "Rugby Union":
                    return "\(baseUrl)search?order-by=relevance&q=rugby%20union&" +
                    "section=sport&\(formatPage)&\(showFields)&api-key=\(apiKey)"

                case "World Cup 2026":
                    return "\(baseUrl)search?section=football&from-date=2026-06-26&to-date=2026-08-31&q=world-cup-2026" +
                    "\(formatPage)&\(showFields)&api-key=\(apiKey)"
                    
                    /*
                     https://content.guardianapis.com/search?section=football&from-date=2026-06-26&to-date=2026-07-31&q=world-cup-2026
                    &api-key=f9108003-c02d-4f9e-bfc4-3f501a618e6b */

                default:
                    return nil
            }
        }

        private enum FetchError: LocalizedError {
            case unknownCategory(String)
            var errorDescription: String? {
                if case .unknownCategory(let cat) = self {
                    return "Unknown news category: \(cat)"
                }
                return nil
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

