//
//  ViewController.swift
//  TMDbApp
//
//  Created by pepe on 25/08/20.
//  Copyright © 2020 pepeMalpica. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MainViewDelegate {
    
    var presenter: MainPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter(delegate: self)
        presenter.makePlayingNowRequest()
    }
    
    func renderMovies(movies: [MovieListItem]) {
        print("Listos para render las movies")
        print("\(movies.count)")
    }


}

