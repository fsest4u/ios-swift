//
//  Book.swift
//  RxSimpleFlickr
//
//  Created by spdevapp on 25/06/2019.
//  Copyright © 2019 Tae joong Yoon. All rights reserved.
//

import ObjectMapper

struct Book : Mappable {
    var book_code : String?
    var showcostcategory : String?
    var category : String?
    var sub_category : String?
    var subject : String?
    var intro : String?
    var writer_id : String?
    var writer_name : String?
    var writer_level : String?
    var total_bytes : String?
    var book_img : String?
    var chk_finish : String?
    var chk_rate : String?
    var rate_recom : String?
    var cnt_rate : Int?
    var cnt_chapter : Int?
    var cnt_page_read : Int?
    var cnt_recom : Int?
    var cnt_favorite : Int?
    var cnt_people : Int?
    var is_study : String?
    var is_ad : String?
    var is_favorite : String?
    var is_festival : String?
    var is_promise_book : String?
    var is_etcGenre : String?
    var is_scenario : String?
    var is_finish : String?
    var is_blcontest : String?
    var is_adultrofan : String?
    var is_voted : String?
    var vote_result : String?
    var finish_state : String?
    var finish_nopaydate : String?
    var finish_price : String?
    var finished : String?
    var finish_freechapter : String?
    var finish_amt_price : String?
    var finish_payrate : String?
    var is_preview : String?
    var preview_openday : String?
    var preview_opentime : String?
    var preview_price : String?
    var premium_payrate : String?
    var is_premium : String?
    var premium_nopaydate : String?
    var premium_price : String?
    var premium_freechapter : String?
    var premium_change_date : String?
    var redate : String?
    var created : String?
    var updated : String?
    var modifyed : String?
    var bookmark_sortno : Int?
    var skin_id : String?
    var heart_status : String?
    var is_festival_free : String?
    var festival_free_chapter : Int?
    var festival_medal_icon : String?
    var is_notice : String?
    var premium_amt_price : String?
    var writer_level_icon_url : String?
    var is_rofan : String?
    var is_adult : String?
    var category_name : String?
    var category_ko_name : String?
    var is_nobless : String?
    var is_romancebl : String?
    var head_icon_url : [String]?
    var new_head_icon_url : [String]?
    var icon_url : [String]?
    var new_icon_url : [String]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        book_code <- map["book_code"]
        showcostcategory <- map["showcostcategory"]
        category <- map["category"]
        sub_category <- map["sub_category"]
        subject <- map["subject"]
        intro <- map["intro"]
        writer_id <- map["writer_id"]
        writer_name <- map["writer_name"]
        writer_level <- map["writer_level"]
        total_bytes <- map["total_bytes"]
        book_img <- map["book_img"]
        chk_finish <- map["chk_finish"]
        chk_rate <- map["chk_rate"]
        rate_recom <- map["rate_recom"]
        cnt_rate <- map["cnt_rate"]
        cnt_chapter <- map["cnt_chapter"]
        cnt_page_read <- map["cnt_page_read"]
        cnt_recom <- map["cnt_recom"]
        cnt_favorite <- map["cnt_favorite"]
        cnt_people <- map["cnt_people"]
        is_study <- map["is_study"]
        is_ad <- map["is_ad"]
        is_favorite <- map["is_favorite"]
        is_festival <- map["is_festival"]
        is_promise_book <- map["is_promise_book"]
        is_etcGenre <- map["is_etcGenre"]
        is_scenario <- map["is_scenario"]
        is_finish <- map["is_finish"]
        is_blcontest <- map["is_blcontest"]
        is_adultrofan <- map["is_adultrofan"]
        is_voted <- map["is_voted"]
        vote_result <- map["vote_result"]
        finish_state <- map["finish_state"]
        finish_nopaydate <- map["finish_nopaydate"]
        finish_price <- map["finish_price"]
        finished <- map["finished"]
        finish_freechapter <- map["finish_freechapter"]
        finish_amt_price <- map["finish_amt_price"]
        finish_payrate <- map["finish_payrate"]
        is_preview <- map["is_preview"]
        preview_openday <- map["preview_openday"]
        preview_opentime <- map["preview_opentime"]
        preview_price <- map["preview_price"]
        premium_payrate <- map["premium_payrate"]
        is_premium <- map["is_premium"]
        premium_nopaydate <- map["premium_nopaydate"]
        premium_price <- map["premium_price"]
        premium_freechapter <- map["premium_freechapter"]
        premium_change_date <- map["premium_change_date"]
        redate <- map["redate"]
        created <- map["created"]
        updated <- map["updated"]
        modifyed <- map["modifyed"]
        bookmark_sortno <- map["bookmark_sortno"]
        skin_id <- map["skin_id"]
        heart_status <- map["heart_status"]
        is_festival_free <- map["is_festival_free"]
        festival_free_chapter <- map["festival_free_chapter"]
        festival_medal_icon <- map["festival_medal_icon"]
        is_notice <- map["is_notice"]
        premium_amt_price <- map["premium_amt_price"]
        writer_level_icon_url <- map["writer_level_icon_url"]
        is_rofan <- map["is_rofan"]
        is_adult <- map["is_adult"]
        category_name <- map["category_name"]
        category_ko_name <- map["category_ko_name"]
        is_nobless <- map["is_nobless"]
        is_romancebl <- map["is_romancebl"]
        head_icon_url <- map["head_icon_url"]
        new_head_icon_url <- map["new_head_icon_url"]
        icon_url <- map["icon_url"]
        new_icon_url <- map["new_icon_url"]
    }
    
    
    //    func flickrURL() -> String? {
    //        guard let farm = farm,
    //            let server = server,
    //            let id = id,
    //            let secret = secret
    //            else {
    //                return nil
    //        }
    //
    //        return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
    //    }
    
    func bookImage() -> String? {
        
        return book_img
    }
    
    // 성실연재 아이콘
    func newHeadIconURL() -> [String]? {
        
        return new_head_icon_url
    }
    
    // 아이콘 셋
    func newIconURL() -> [String]? {
        
        return new_icon_url
        
    }
    
    // 작가 아이콘
    func writerLevelIconURL() -> String? {
        
        return writer_level_icon_url
    }
    
    
    
}
