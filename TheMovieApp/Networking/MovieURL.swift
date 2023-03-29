//
//  MovieURL.swift
//  TheMovieApp
//
//  Created by Burak Öztopuz on 2.09.2022.
//

import Foundation

enum MovieUrl : String {
    case nowPlaying = "now_playing"
    case upComing = "upcoming"
    case popular = "popular"
    
    static var urlString : String {
        "base_url\(self.RawValue)?api_key=\(API.key)&language=en-US&page=1"
    }
}
