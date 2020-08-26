//
//  DetailViewController.swift
//  TMDbApp
//
//  Created by pepe on 26/08/20.
//  Copyright © 2020 pepeMalpica. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController, DetailViewDelegate {

    var movieId: Int?
    
    var presenter: DetailPresenter!
    
    @IBOutlet weak var ivBackDrop: UIImageView!
    @IBOutlet weak var lbRuntime: UILabel!
    @IBOutlet weak var lbReleaseDate: UILabel!
    @IBOutlet weak var lbVoteAverage: UILabel!
    @IBOutlet weak var lbGenres: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = DetailPresenter(delegate: self)
        presenter.makeDetailRequest( id: movieId! )
        
    }
    
    //MARK:-- DetailViewDelegate implementation
    func renderMovie(movie: Movie){
        if let backdop = movie.backdrop_path {
                ivBackDrop.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/"+backdop))
        }
        lbRuntime.text = String(movie.runtime ?? 0 )+" min"
        lbReleaseDate.text = movie.release_date
        lbVoteAverage.text = String(movie.vote_average ?? 0.0)
        lbDescription.text = movie.overview
        lbTitle.text = movie.title
        // render genres
        var genresString = ""
        var counting = 0
        movie.genres.forEach { (genre) in
            genresString+="\(genre.name)"
            counting += 1
            if( counting != movie.genres.count ){
                    genresString+=", "
            }
            
        }
        lbGenres.text = genresString
    }
    
}
