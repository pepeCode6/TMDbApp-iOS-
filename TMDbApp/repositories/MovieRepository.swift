//
//  MovieRepository.swift
//  TMDbApp
//
//  Created by pepe on 25/08/20.
//  Copyright © 2020 pepeMalpica. All rights reserved.
//

import Foundation


class MovieRepository {
    
    static let shared: MovieRepository = MovieRepository()
    private let client: Client = Client.shared
    
    private init() { }
    
    func getPlayingNow( success: @escaping (_ movies: [MovieListItem])->Void, failure: @escaping (_ msg: String)->Void ) {
        var movies: [MovieListItem] = [ ]
        client.call(endPoint: "now_playing?api_key=634b49e294bd1ff87914e7b9d014daed&language=es&page=1", method: .get, success: { (res:PlayingNowRes ) in
            print("count: \(res.results.count)")
            movies.append(contentsOf: res.results)
            success(movies)
        }) { (err) in
            print(err)
        }
    }
    
    
}

struct MoviesDates:Decodable {
    var maximum: String
    var minimum: String
}

struct PlayingNowRes:Decodable {
    var page: Int
    var total_results: Int
    var dates: MoviesDates
    var total_pages: Int
    var results: [MovieListItem]
}


struct MovieListItem:Decodable {
    
    var popularity: Double
    var vote_count: Double
    var video: Bool
    var poster_path: String
    var id: Int
    var adult: Bool
    var backdrop_path: String
    var original_language: String
    var original_title: String
    var genre_ids: [Int]
    var title: String
    var vote_average: Double
    var overview: String
    var release_date: String
    
}
