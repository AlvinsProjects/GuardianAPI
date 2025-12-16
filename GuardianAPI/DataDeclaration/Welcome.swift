//
//  Welcome.swift
//  GuardianAPI
//
//  Created by Alvin Alleyne on 12/10/25.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

import Foundation

// MARK: - Welcome
//struct Welcome: Codable {
//    var response: Response
//}

// MARK: Welcome convenience initializers and mutators

//extension Welcome {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(Welcome.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        response: Response? = nil
//    ) -> Welcome {
//        return Welcome(
//            response: response ?? self.response
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
// MARK: - Response
//struct Response: Codable {
//    var status, userTier: String
//    var total, startIndex, pageSize, currentPage: Int
//    var pages: Int
//    var orderBy: String
//    var results: [Result]
//}

// MARK: Response convenience initializers and mutators

//extension Response {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(Response.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        status: String? = nil,
//        userTier: String? = nil,
//        total: Int? = nil,
//        startIndex: Int? = nil,
//        pageSize: Int? = nil,
//        currentPage: Int? = nil,
//        pages: Int? = nil,
//        orderBy: String? = nil,
//        results: [Result]? = nil
//    ) -> Response {
//        return Response(
//            status: status ?? self.status,
//            userTier: userTier ?? self.userTier,
//            total: total ?? self.total,
//            startIndex: startIndex ?? self.startIndex,
//            pageSize: pageSize ?? self.pageSize,
//            currentPage: currentPage ?? self.currentPage,
//            pages: pages ?? self.pages,
//            orderBy: orderBy ?? self.orderBy,
//            results: results ?? self.results
//        )
//    }

//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }

//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}


// MARK: - Result
//struct Result: Codable {
//    var id: String
//    var type: TypeEnum
//    var sectionID, sectionName: String
//    var webPublicationDate: Date
//    var webTitle: String
//    var webURL, apiURL: String
//    var isHosted: Bool
//    var pillarID: PillarID
//    var pillarName: PillarName

//    enum CodingKeys: String, CodingKey {
//        case id, type
//        case sectionID = "sectionId"
//        case sectionName, webPublicationDate, webTitle
//        case webURL = "webUrl"
//        case apiURL = "apiUrl"
//        case isHosted
//        case pillarID = "pillarId"
//        case pillarName
//    }
//}

// MARK: Result convenience initializers and mutators

//extension Result {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(Result.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }

//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }

//    func with(
//        id: String? = nil,
//        type: TypeEnum? = nil,
//        sectionID: String? = nil,
//        sectionName: String? = nil,
//        webPublicationDate: Date? = nil,
//        webTitle: String? = nil,
//        webURL: String? = nil,
//        apiURL: String? = nil,
//        isHosted: Bool? = nil,
//        pillarID: PillarID? = nil,
//        pillarName: PillarName? = nil
//    ) -> Result {
//        return Result(
//            id: id ?? self.id,
//            type: type ?? self.type,
//            sectionID: sectionID ?? self.sectionID,
//            sectionName: sectionName ?? self.sectionName,
//            webPublicationDate: webPublicationDate ?? self.webPublicationDate,
//            webTitle: webTitle ?? self.webTitle,
//            webURL: webURL ?? self.webURL,
//            apiURL: apiURL ?? self.apiURL,
//            isHosted: isHosted ?? self.isHosted,
//            pillarID: pillarID ?? self.pillarID,
//            pillarName: pillarName ?? self.pillarName
//        )
//    }

//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }

//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}

//enum PillarID: String, Codable {
//    case pillarArts = "pillar/arts"
//    case pillarNews = "pillar/news"
//    case pillarOpinion = "pillar/opinion"
//}

//enum PillarName: String, Codable {
//    case arts = "Arts"
//    case news = "News"
//    case opinion = "Opinion"
//}

//enum TypeEnum: String, Codable {
//    case article = "article"
//    case liveblog = "liveblog"
//}

// MARK: - Helper functions for creating encoders and decoders

//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}

//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}
