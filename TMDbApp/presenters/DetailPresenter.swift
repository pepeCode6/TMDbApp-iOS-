//
//  DetailPresenter.swift
//  TMDbApp
//
//  Created by pepe on 26/08/20.
//  Copyright © 2020 pepeMalpica. All rights reserved.
//

import Foundation


class DetailPresenter {
    
    var delegate: DetailViewDelegate
    let movieRepository: MovieRepository = MovieRepository.shared
    
    init( delegate: DetailViewDelegate ){
        self.delegate = delegate
    }
    
    func makeDetailRequest( id: Int ){
        movieRepository.getDetail(id: id, success: { (movie) in
            self.delegate.renderMovie(movie: movie)
        }) { (err) in
            print("Upps, ha ocurrido un error: \(err)")
        }
    }
    
}



