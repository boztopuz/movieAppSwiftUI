//
//  Movie.swift
//  TheMovieApp
//
//  Created by Burak Öztopuz on 30.08.2022.
//

import Foundation

struct MovieResponse : Codable {
    var results : [Movie]
}

struct Movie : Codable, Identifiable {
    let backdropPath: String?
    let id: Int?
    let original_language: String?
    let original_title, overview: String?
    let popularity: Double?
    let poster_path: String?
    let title: String?
    let video: Bool?
    let vote_average: Double?
    let voteCount: Int?
    let release_date : String?
    var posterPath : String{
        if let path = poster_path {
            return "https://image.tmdb.org/t/p/original/\(path)"
        }else{
            return ""
        }
    }
    
    var voteAvarage : Double {
        if let avg = vote_average{
            return avg / 10.0
        }
        return 0.0
    }
    
    var titleWithLanguage : String {
        guard let title = title, let lang = original_language else {
            return ""
        }
        return "\(title)(\(lang))"
        
    }
}
