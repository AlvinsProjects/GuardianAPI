//
//  StartData.swift
//  GuardianAPI
//
//  Created by Alvin Alleyne on 1/7/26.
//

import Foundation



struct Constants {
    // set up base url
    static let baseUrl = "https://content.guardianapis.com/"
    
    // set up my API Key
    static let apiKey: String = "f9108003-c02d-4f9e-bfc4-3f501a618e6b"
}


struct urlDataType: Identifiable {
    let id: String
    let url: String
}


struct StartData  {
    
    static let apiURL = [
        urlDataType(id: "Geneal News", url: "\(Constants.baseUrl)search?section=world&format=json&page=1&page-size=40&order-by=newest&lang=en&show-fields=thumbnail,headline,short-url,webPublicationDate,sectionName,webTitle,apiURL&api-key=\(Constants.apiKey)"),
        
        urlDataType(id: "Cricket", url: "\(Constants.baseUrl)search?q=Cricket&format=json&section=sport&page=1&page-size=40&order-by=newest&lang=en&show-fields=thumbnail&api-key=\(Constants.apiKey)"),
        
        urlDataType(id: "Tennis", url: "\(Constants.baseUrl)search?q=tennis&format=json&section=sport&page=1&page-size=40&order-by=newest&lang=en&show-fields=thumbnail,headline,short-url,webPublicationDate,sectionName,webTitle,apiURL,isHosted&api-key=\(Constants.apiKey)"),
        
        urlDataType(id: "Rugby", url: "\(Constants.baseUrl)search?q=rugby&format=json&section=sport&&page=1&page-size=40&order-by=newest&lang=en&show-fields=headline,short-url,thumbnail,webPublicationDate,sectionName,webTitle,apiURL,isHosted&api-key=\(Constants.apiKey)")
    ]
}


struct Global {
    static var apiUrlString = ""
}





/*
 
 //MARK: RUGBY
 // Search for the latest RUGBY items - any subject.
 let apiUrlString4 = "\(baseUrl)search?q=rugby&format=json&section=sport&&page=1&page-size=40&order-by=newest&lang=en&show-fields=headline,short-url,thumbnail,webPublicationDate,sectionName,webTitle,apiURL,isHosted&api-key=\(apiKey)"
 
 
 
 //MARK: TENNIS
  Search for the latest TENNIS news:
 let apiUrlString3 = "\(baseUrl)search?q=tennis&format=json&section=sport&page=1&page-size=40&order-by=newest&lang=en&show-fields=thumbnail,headline,short-url,webPublicationDate,sectionName,webTitle,apiURL,isHosted&api-key=\(apiKey)"
 
 
 
MARK: CRICKET
 Search for the latest cricket (Ashes) news - using the fields defined above
let apiUrlString2 = "\(baseUrl)search?q=Cricket&format=json&section=sport&page=1&page-size=40&order-by=newest&lang=en&show-fields=thumbnail&api-key=\(apiKey)"

//MARK: GENERAL NEWS
let apiUrlString1 = "\(baseUrl)search?section=world&&format=json&page=1&page-size=40&order-by=newest&lang=en&show-fields=thumbnail,headline,short-url,webPublicationDate,sectionName,webTitle,apiURL&api-key=\(apiKey)"


*/
