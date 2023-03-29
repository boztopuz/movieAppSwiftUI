//
//  Cast.swift
//  TheMovieApp
//
//  Created by Burak Öztopuz on 31.08.2022.
//

import Foundation


struct CastResponse : Codable {
    var cast : [Cast]
}

struct Cast : Codable {
    var id : Int?
    var name : String?
    var character : String?
    var photo_path : String?
    
    var photo : String {
        if let path = photo_path {
            return "https://image.tmdb.org/t/p/original/\(path)"
        }
        return ""
    }
}
