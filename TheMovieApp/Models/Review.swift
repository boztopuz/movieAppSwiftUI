//
//  Review.swift
//  TheMovieApp
//
//  Created by Burak Öztopuz on 31.08.2022.
//

import Foundation

struct ReviewResponse : Codable {
    var results : [Review]
}

struct Review : Codable{
    var id : Int?
    var content : String?
    var author : String?
}
