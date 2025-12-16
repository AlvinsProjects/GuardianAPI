//
//  Article.swift
//  GuardianAPI
//
//  Created by Alvin Alleyne on 12/8/25.
//

import Foundation


// MARK: - Welcome
struct GuardianResponse: Codable {
    let response: ResponseDetails
}


// MARK: - Response
struct ResponseDetails: Codable {
    let status     : String
    let userTier   : String
    let total      : Int
    let pageCount  : Int?
    let startIndex : Int
    let pageSize   : Int
    let currentPage: Int
    let pages      : Int
    let orderBy    : String
    let results    : [Article]
}


// MARK: - Result
struct Article: Codable, Identifiable, Hashable {
    let id: String
    let type: TypeEnum
    let sectionID: String
    let sectionName: String
    let webPublicationDate: Date
    let webTitle: String
    let webURL: String
    let apiURL: String
    let isHosted: Bool
//    let pillarID: PillarID
//    let pillarName: PillarName
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case sectionID = "sectionId"
        case sectionName
        case webPublicationDate
        case webTitle
        case webURL = "webUrl"
        case apiURL = "apiUrl"
        case isHosted
//        case pillarID = "pillarId"
//        case pillarName
    }
}


//enum PillarID: String, Codable {
//    case pillarArts = "pillar/arts"
//    case pillarNews = "pillar/news"
//}


//enum PillarName: String, Codable {
//    case arts = "Arts"
//    case news = "News"
//}


enum TypeEnum: String, Codable {
    case article = "article"
    case liveblog = "liveblog"
}
