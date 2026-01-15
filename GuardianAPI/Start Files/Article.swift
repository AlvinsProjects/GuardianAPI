//
//  Article.swift
//  GuardianAPI
//
//  Created by Alvin Alleyne on 12/8/25.
//

import Foundation


// MARK: - Welcome
struct GuardianResponse: Codable {
    var response: ResponseDetails
}


// MARK: - Response
struct ResponseDetails: Codable {
    var status     : String
    var userTier   : String
    var total      : Int
//    var pageCount  : Int?
    var startIndex : Int
    var pageSize   : Int
    var currentPage: Int
    var pages      : Int
    var orderBy    : String
    var results    : [Article]
}


// MARK: - Result
struct Article: Codable {
    var id: String
    var type: TypeEnum
    var sectionID: String
    var sectionName: String
    var webPublicationDate: Date
    var webTitle: String
    var webUrl: String
    var apiUrl: String
    let fields: Fields
    var isHosted: Bool
    let pillarID: String
    let pillarName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case sectionID = "sectionId"
        case sectionName
        case webPublicationDate
        case webTitle
        case webUrl //= "webUrl"
        case apiUrl //= "apiUrl"
        case fields
        case isHosted
        case pillarID = "pillarId"
        case pillarName
    }
    
    static let example = Article(
        id: "This is the id",
        type: TypeEnum.article,
        sectionID: "This entry is the sectionID",
        sectionName: "This is the SectionName",
        webPublicationDate: Date(),
        webTitle: "The webTitle is very important",
        webUrl: "https://hws.dev/img/logo.png",
        apiUrl: "https://hws.dev/img/logo.png",
        fields: Fields(
            headline: "Example headline",
            shortURL: "https://hws.dev/img/logo.png",
            thumbnail: "https://hws.dev/img/logo.png",
            isHosted: false
        ),
        isHosted: true,
        pillarID: "pillarId",
        pillarName: "Example Pillar"
    )
}



struct Fields: Codable {
    let headline: String?
    let shortURL: String?
    let thumbnail: String   // This holds the thumbnail URL
    let isHosted: Bool?
}


enum PillarID: String, Codable {
    case pillarArts = "pillar/arts"
    case pillarNews = "pillar/news"
}


enum PillarName: String, Codable {
    case arts = "Arts"
    case news = "News"
}


enum TypeEnum: String, Codable {
    case article  = "article"
    case liveblog = "liveblog"
}


//enum SectionID: String, Codable {
//    case sport = "sport"
//}

