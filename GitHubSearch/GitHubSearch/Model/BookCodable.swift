//
//  BookCodable.swift
//  GitHubSearch
//
//  Created by spdevapp on 28/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bookList = try BookList(json)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseBookList { response in
//     if let bookList = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - BookList
struct BookList: Codable {
    let status: Int
    let totalCnt: String
    let page, offset: Int
    let books: [BookCodable]
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalCnt = "total_cnt"
        case page, offset, books
    }
}

// MARK: BookList convenience initializers and mutators

extension BookList {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(BookList.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        status: Int? = nil,
        totalCnt: String? = nil,
        page: Int? = nil,
        offset: Int? = nil,
        books: [BookCodable]? = nil
        ) -> BookList {
        return BookList(
            status: status ?? self.status,
            totalCnt: totalCnt ?? self.totalCnt,
            page: page ?? self.page,
            offset: offset ?? self.offset,
            books: books ?? self.books
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseBook { response in
//     if let bookCodable = response.result.value {
//       ...
//     }
//   }

// MARK: - BookCodable
struct BookCodable: Codable {
    let bookCode, showcostcategory, category, subCategory: String
    let subject, intro, writerID, writerName: String
    let writerLevel, totalBytes: String
    let bookImg: String
    let chkFinish, chkRate: TartuGecko
    let rateRecom: String
    let cntRate, cntChapter, cntPageRead, cntRecom: Int
    let cntFavorite, cntPeople: Int
    let isStudy, isAd, isFavorite, isFestival: TartuGecko
    let isPromiseBook: IsPromiseBook
    let isEtcGenre, isScenario, isFinish, isBlcontest: TartuGecko
    let isAdultrofan: TartuGecko
    let isVoted: IsVoted
    let voteResult, finishState: TartuGecko
    let finishNopaydate, finishPrice, finished, finishFreechapter: JSONNull?
    let finishAmtPrice, finishPayrate: JSONNull?
    let isPreview, previewOpenday, previewOpentime, previewPrice: TartuGecko
    let premiumPayrate: String
    let isPremium, premiumNopaydate: TartuGecko
    let premiumPrice, premiumFreechapter: String
    let premiumChangeDate: TartuGecko
    let redate, created, updated, modifyed: String
    let bookmarkSortno: Int
    let skinID: TartuGecko
    let heartStatus: String
    let isFestivalFree: TartuGecko
    let festivalFreeChapter: Int
    let festivalMedalIcon, isNotice: TartuGecko
    let premiumAmtPrice: String
    let writerLevelIconURL: String
    let isRofan, isAdult: TartuGecko
    let categoryName, categoryKoName: String
    let isNobless, isRomancebl: TartuGecko
    let headIconURL, newHeadIconURL, iconURL, newIconURL: [String]
    
    enum CodingKeys: String, CodingKey {
        case bookCode = "book_code"
        case showcostcategory, category
        case subCategory = "sub_category"
        case subject, intro
        case writerID = "writer_id"
        case writerName = "writer_name"
        case writerLevel = "writer_level"
        case totalBytes = "total_bytes"
        case bookImg = "book_img"
        case chkFinish = "chk_finish"
        case chkRate = "chk_rate"
        case rateRecom = "rate_recom"
        case cntRate = "cnt_rate"
        case cntChapter = "cnt_chapter"
        case cntPageRead = "cnt_page_read"
        case cntRecom = "cnt_recom"
        case cntFavorite = "cnt_favorite"
        case cntPeople = "cnt_people"
        case isStudy = "is_study"
        case isAd = "is_ad"
        case isFavorite = "is_favorite"
        case isFestival = "is_festival"
        case isPromiseBook = "is_promise_book"
        case isEtcGenre = "is_etcGenre"
        case isScenario = "is_scenario"
        case isFinish = "is_finish"
        case isBlcontest = "is_blcontest"
        case isAdultrofan = "is_adultrofan"
        case isVoted = "is_voted"
        case voteResult = "vote_result"
        case finishState = "finish_state"
        case finishNopaydate = "finish_nopaydate"
        case finishPrice = "finish_price"
        case finished
        case finishFreechapter = "finish_freechapter"
        case finishAmtPrice = "finish_amt_price"
        case finishPayrate = "finish_payrate"
        case isPreview = "is_preview"
        case previewOpenday = "preview_openday"
        case previewOpentime = "preview_opentime"
        case previewPrice = "preview_price"
        case premiumPayrate = "premium_payrate"
        case isPremium = "is_premium"
        case premiumNopaydate = "premium_nopaydate"
        case premiumPrice = "premium_price"
        case premiumFreechapter = "premium_freechapter"
        case premiumChangeDate = "premium_change_date"
        case redate, created, updated, modifyed
        case bookmarkSortno = "bookmark_sortno"
        case skinID = "skin_id"
        case heartStatus = "heart_status"
        case isFestivalFree = "is_festival_free"
        case festivalFreeChapter = "festival_free_chapter"
        case festivalMedalIcon = "festival_medal_icon"
        case isNotice = "is_notice"
        case premiumAmtPrice = "premium_amt_price"
        case writerLevelIconURL = "writer_level_icon_url"
        case isRofan = "is_rofan"
        case isAdult = "is_adult"
        case categoryName = "category_name"
        case categoryKoName = "category_ko_name"
        case isNobless = "is_nobless"
        case isRomancebl = "is_romancebl"
        case headIconURL = "head_icon_url"
        case newHeadIconURL = "new_head_icon_url"
        case iconURL = "icon_url"
        case newIconURL = "new_icon_url"
    }
}

// MARK: BookCodable convenience initializers and mutators

extension BookCodable {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(BookCodable.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        bookCode: String? = nil,
        showcostcategory: String? = nil,
        category: String? = nil,
        subCategory: String? = nil,
        subject: String? = nil,
        intro: String? = nil,
        writerID: String? = nil,
        writerName: String? = nil,
        writerLevel: String? = nil,
        totalBytes: String? = nil,
        bookImg: String? = nil,
        chkFinish: TartuGecko? = nil,
        chkRate: TartuGecko? = nil,
        rateRecom: String? = nil,
        cntRate: Int? = nil,
        cntChapter: Int? = nil,
        cntPageRead: Int? = nil,
        cntRecom: Int? = nil,
        cntFavorite: Int? = nil,
        cntPeople: Int? = nil,
        isStudy: TartuGecko? = nil,
        isAd: TartuGecko? = nil,
        isFavorite: TartuGecko? = nil,
        isFestival: TartuGecko? = nil,
        isPromiseBook: IsPromiseBook? = nil,
        isEtcGenre: TartuGecko? = nil,
        isScenario: TartuGecko? = nil,
        isFinish: TartuGecko? = nil,
        isBlcontest: TartuGecko? = nil,
        isAdultrofan: TartuGecko? = nil,
        isVoted: IsVoted? = nil,
        voteResult: TartuGecko? = nil,
        finishState: TartuGecko? = nil,
        finishNopaydate: JSONNull?? = nil,
        finishPrice: JSONNull?? = nil,
        finished: JSONNull?? = nil,
        finishFreechapter: JSONNull?? = nil,
        finishAmtPrice: JSONNull?? = nil,
        finishPayrate: JSONNull?? = nil,
        isPreview: TartuGecko? = nil,
        previewOpenday: TartuGecko? = nil,
        previewOpentime: TartuGecko? = nil,
        previewPrice: TartuGecko? = nil,
        premiumPayrate: String? = nil,
        isPremium: TartuGecko? = nil,
        premiumNopaydate: TartuGecko? = nil,
        premiumPrice: String? = nil,
        premiumFreechapter: String? = nil,
        premiumChangeDate: TartuGecko? = nil,
        redate: String? = nil,
        created: String? = nil,
        updated: String? = nil,
        modifyed: String? = nil,
        bookmarkSortno: Int? = nil,
        skinID: TartuGecko? = nil,
        heartStatus: String? = nil,
        isFestivalFree: TartuGecko? = nil,
        festivalFreeChapter: Int? = nil,
        festivalMedalIcon: TartuGecko? = nil,
        isNotice: TartuGecko? = nil,
        premiumAmtPrice: String? = nil,
        writerLevelIconURL: String? = nil,
        isRofan: TartuGecko? = nil,
        isAdult: TartuGecko? = nil,
        categoryName: String? = nil,
        categoryKoName: String? = nil,
        isNobless: TartuGecko? = nil,
        isRomancebl: TartuGecko? = nil,
        headIconURL: [String]? = nil,
        newHeadIconURL: [String]? = nil,
        iconURL: [String]? = nil,
        newIconURL: [String]? = nil
        ) -> BookCodable {
        return BookCodable(
            bookCode: bookCode ?? self.bookCode,
            showcostcategory: showcostcategory ?? self.showcostcategory,
            category: category ?? self.category,
            subCategory: subCategory ?? self.subCategory,
            subject: subject ?? self.subject,
            intro: intro ?? self.intro,
            writerID: writerID ?? self.writerID,
            writerName: writerName ?? self.writerName,
            writerLevel: writerLevel ?? self.writerLevel,
            totalBytes: totalBytes ?? self.totalBytes,
            bookImg: bookImg ?? self.bookImg,
            chkFinish: chkFinish ?? self.chkFinish,
            chkRate: chkRate ?? self.chkRate,
            rateRecom: rateRecom ?? self.rateRecom,
            cntRate: cntRate ?? self.cntRate,
            cntChapter: cntChapter ?? self.cntChapter,
            cntPageRead: cntPageRead ?? self.cntPageRead,
            cntRecom: cntRecom ?? self.cntRecom,
            cntFavorite: cntFavorite ?? self.cntFavorite,
            cntPeople: cntPeople ?? self.cntPeople,
            isStudy: isStudy ?? self.isStudy,
            isAd: isAd ?? self.isAd,
            isFavorite: isFavorite ?? self.isFavorite,
            isFestival: isFestival ?? self.isFestival,
            isPromiseBook: isPromiseBook ?? self.isPromiseBook,
            isEtcGenre: isEtcGenre ?? self.isEtcGenre,
            isScenario: isScenario ?? self.isScenario,
            isFinish: isFinish ?? self.isFinish,
            isBlcontest: isBlcontest ?? self.isBlcontest,
            isAdultrofan: isAdultrofan ?? self.isAdultrofan,
            isVoted: isVoted ?? self.isVoted,
            voteResult: voteResult ?? self.voteResult,
            finishState: finishState ?? self.finishState,
            finishNopaydate: finishNopaydate ?? self.finishNopaydate,
            finishPrice: finishPrice ?? self.finishPrice,
            finished: finished ?? self.finished,
            finishFreechapter: finishFreechapter ?? self.finishFreechapter,
            finishAmtPrice: finishAmtPrice ?? self.finishAmtPrice,
            finishPayrate: finishPayrate ?? self.finishPayrate,
            isPreview: isPreview ?? self.isPreview,
            previewOpenday: previewOpenday ?? self.previewOpenday,
            previewOpentime: previewOpentime ?? self.previewOpentime,
            previewPrice: previewPrice ?? self.previewPrice,
            premiumPayrate: premiumPayrate ?? self.premiumPayrate,
            isPremium: isPremium ?? self.isPremium,
            premiumNopaydate: premiumNopaydate ?? self.premiumNopaydate,
            premiumPrice: premiumPrice ?? self.premiumPrice,
            premiumFreechapter: premiumFreechapter ?? self.premiumFreechapter,
            premiumChangeDate: premiumChangeDate ?? self.premiumChangeDate,
            redate: redate ?? self.redate,
            created: created ?? self.created,
            updated: updated ?? self.updated,
            modifyed: modifyed ?? self.modifyed,
            bookmarkSortno: bookmarkSortno ?? self.bookmarkSortno,
            skinID: skinID ?? self.skinID,
            heartStatus: heartStatus ?? self.heartStatus,
            isFestivalFree: isFestivalFree ?? self.isFestivalFree,
            festivalFreeChapter: festivalFreeChapter ?? self.festivalFreeChapter,
            festivalMedalIcon: festivalMedalIcon ?? self.festivalMedalIcon,
            isNotice: isNotice ?? self.isNotice,
            premiumAmtPrice: premiumAmtPrice ?? self.premiumAmtPrice,
            writerLevelIconURL: writerLevelIconURL ?? self.writerLevelIconURL,
            isRofan: isRofan ?? self.isRofan,
            isAdult: isAdult ?? self.isAdult,
            categoryName: categoryName ?? self.categoryName,
            categoryKoName: categoryKoName ?? self.categoryKoName,
            isNobless: isNobless ?? self.isNobless,
            isRomancebl: isRomancebl ?? self.isRomancebl,
            headIconURL: headIconURL ?? self.headIconURL,
            newHeadIconURL: newHeadIconURL ?? self.newHeadIconURL,
            iconURL: iconURL ?? self.iconURL,
            newIconURL: newIconURL ?? self.newIconURL
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum TartuGecko: String, Codable {
    case tartuGeckoFALSE = "FALSE"
    case tartuGeckoTRUE = "TRUE"
}

enum IsPromiseBook: String, Codable {
    case empty = ""
    case n = "N"
}

enum IsVoted: String, Codable {
    case empty = ""
    case isVotedFALSE = "FALSE"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Alamofire response handlers

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try newJSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseBookList(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<BookList>) -> Void) -> Self {
        print("asdf")
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public func hash(into hasher: inout Hasher) {
        // No-op
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
