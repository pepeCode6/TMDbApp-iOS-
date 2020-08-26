//
//  MainPresenter.swift
//  TMDbApp
//
//  Created by pepe on 25/08/20.
//  Copyright © 2020 pepeMalpica. All rights reserved.
//

import Foundation



class MainPresenter {
    
    var mainViewDelegate: MainViewDelegate
    let movieRepository: MovieRepository = MovieRepository.shared
    
    init( delegate: MainViewDelegate ){
        self.mainViewDelegate = delegate
    }
    
    func makePlayingNowRequest() {
        movieRepository.getPlayingNow(success: { (movies) in
            self.mainViewDelegate.renderMovies(movies: movies)
        }) { (err) in
            print("hay un error")
        }
    }
    
    
}

