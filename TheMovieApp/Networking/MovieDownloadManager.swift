//
//  MovieDownloadManager.swift
//  TheMovieApp
//
//  Created by Burak Öztopuz on 2.09.2022.
//

import SwiftUI

final class MovieDownloadManager : ObservableObject{
    @Published var movies = [Movie]()
    @Published var cast = [Cast]()
    
    static var baseUrl = "https://api.themoviedb.org/3/movie/"
    
    func nowPlaying(){
        getMovies(movieUrl: .nowPlaying)
    }
    
    func upComing(){
        getMovies(movieUrl: .upComing)
    }
    
    func popular(){
        getMovies(movieUrl: .popular)
    }
    
    func getCast(for movie : Movie){
        let urlString = "\(Self.baseUrl)\(movie.id ?? 100)/credits?api_key=\(API.key)&language=en-US"
        NetworkManager<CastResponse>.fetch(from: urlString) { result in
            switch result {
            case .success(let response) :
                self.cast = response.cast
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    private func getMovies(movieUrl : MovieUrl){
        NetworkManager<MovieResponse>.fetch(from: MovieUrl.urlString) { result in
            switch result {
            case .success(let movieResponse) :
                self.movies = movieResponse.results
            case .failure(let error) :
                print(error)
            }
        }
    }
}
