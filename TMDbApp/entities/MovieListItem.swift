//
//  MovieListItem.swift
//  TMDbApp
//
//  Created by pepe on 26/08/20.
//  Copyright © 2020 pepeMalpica. All rights reserved.
//

import Foundation


struct MovieListItem:Decodable {
    
    var popularity: Double
    var vote_count: Double
    var video: Bool
    var poster_path: String?
    var id: Int
    var adult: Bool
    var backdrop_path: String?
    var original_language: String
    var original_title: String
    var genre_ids: [Int]
    var title: String
    var vote_average: Double
    var overview: String
    var release_date: String
    
}
