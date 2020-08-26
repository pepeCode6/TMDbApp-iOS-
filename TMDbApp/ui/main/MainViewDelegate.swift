//
//  MainViewDelegate.swift
//  TMDbApp
//
//  Created by pepe on 25/08/20.
//  Copyright © 2020 pepeMalpica. All rights reserved.
//

import Foundation


protocol MainViewDelegate {
    
    func renderMovies( movies: [MovieListItem] )
    
}
