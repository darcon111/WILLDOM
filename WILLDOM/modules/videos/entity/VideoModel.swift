//
//  VideoModel.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import Foundation
import ObjectMapper

struct VideoModel : Mappable {
    var iso_639_1 : String?
    var iso_3166_1 : String?
    var name : String?
    var key : String?
    var site : String?
    var size : Int?
    var type : String?
    var official : Bool?
    var published_at : String?
    var id : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        iso_639_1 <- map["iso_639_1"]
        iso_3166_1 <- map["iso_3166_1"]
        name <- map["name"]
        key <- map["key"]
        site <- map["site"]
        size <- map["size"]
        type <- map["type"]
        official <- map["official"]
        published_at <- map["published_at"]
        id <- map["id"]
    }

}

