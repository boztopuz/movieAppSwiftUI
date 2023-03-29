//
//  NetworkManager.swift
//  TheMovieApp
//
//  Created by Burak Öztopuz on 2.09.2022.
//

import Foundation
import Alamofire

final class NetworkManager<T : Codable> {
    static func fetch(from url : String, completion : @escaping(Result<T , NetworkError>)->Void){
        AF.request(url).responseDecodable(of : T.self) { (response) in
            if response.error != nil {
                completion(.failure(.invalidResponse))
                return
            }
            if let payload = response.value {
                completion(.success(payload))
                return
            }
            completion(.failure(.nilResponse))
        }
    }
}

enum NetworkError : Error {
    case invalidResponse
    case nilResponse
}
