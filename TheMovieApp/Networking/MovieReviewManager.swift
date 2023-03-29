//
//  MovieReviewManager.swift
//  TheMovieApp
//
//  Created by Burak Öztopuz on 2.09.2022.
//

import SwiftUI

final class MovieReviewManager : ObservableObject{
    @Published var reviews = [Review]()
    
    private var movie : Movie
    static var baseUrl = "https://api.themoviedb.org/3/movie/"
    
    init(movie : Movie){
        self.movie = movie
    }
    
    func getMovieReviews(){
        
    }
    
    private func getReviews(for movie : Movie){
        let urlString = "\(Self.baseUrl)\(movie.id ?? 100)/rewievs?api_key=\(API.key)"
        NetworkManager<ReviewResponse>.fetch(from: urlString) { result in
            switch result {
            case .success(let response) :
                self.reviews = response.results
            case .failure(let error) :
                print(error)
            }
        }
    }
}
