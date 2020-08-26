//
//  Movie.swift
//  TMDbApp
//
//  Created by pepe on 26/08/20.
//  Copyright © 2020 pepeMalpica. All rights reserved.
//

import Foundation

struct Movie: Decodable{
    var status: String?
    var tagline: String?
    var title: String?
    var release_date: String?
    var backdrop_path: String?
    var poster_path: String?
    var homepage: String?
    var imdb_id: String?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var video: Bool?
    var adult: Bool?
    var vote_average: Double?
    var popularity: Double?
    var vote_count: Int?
    var revenue: Int?
    var runtime: Int?
    var budget: Int?
    var id: Int?
    var genres: [Genres]
}
