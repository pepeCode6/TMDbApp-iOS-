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
    
    func getPlayingNow( page: Int, success: @escaping (_ movies: [MovieListItem])->Void, failure: @escaping (_ msg: String)->Void ) {
        var movies: [MovieListItem] = [ ]
        client.call(endPoint: "now_playing?api_key=634b49e294bd1ff87914e7b9d014daed&language=es&page=\(String(page))", method: .get, success: { (res:PlayingNowRes ) in
            print("count: \(res.results.count)")
            movies.append(contentsOf: res.results)
            success(movies)
        }) { (err) in
            print(err)
        }
    }
    
    func getDetail( id: Int, success: @escaping (_ movie: Movie)->Void, failure: @escaping (_ msg: String)->Void ) {
        client.call(endPoint: "\(id)?api_key=634b49e294bd1ff87914e7b9d014daed&language=es", method: .get, success: { (res:Movie ) in
            success(res)
        }) { (err) in
            print(err)
        }
    }
    
    
}




