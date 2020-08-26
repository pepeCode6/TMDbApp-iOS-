//
//  PlayingNowRes.swift
//  TMDbApp
//
//  Created by pepe on 26/08/20.
//  Copyright © 2020 pepeMalpica. All rights reserved.
//

import Foundation


struct PlayingNowRes:Decodable {
    var page: Int
    var total_results: Int
    var dates: MoviesDates
    var total_pages: Int
    var results: [MovieListItem]
}
