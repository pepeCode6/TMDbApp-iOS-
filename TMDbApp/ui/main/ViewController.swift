//
//  ViewController.swift
//  TMDbApp
//
//  Created by pepe on 25/08/20.
//  Copyright © 2020 pepeMalpica. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, MainViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var presenter: MainPresenter!
    @IBOutlet weak var cvMovies: UICollectionView!
    var movies: [MovieListItem] = []
    var selectedMovie: MovieListItem?
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cvMovies.delegate = self
        cvMovies.dataSource = self
        
        presenter = MainPresenter(delegate: self)
        presenter.makePlayingNowRequest(page: page)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        cvMovies.setCollectionViewLayout(layout, animated: true)
    }
    
    //MARK:-- MainViewDelegate implementation
    func renderMovies(movies: [MovieListItem]) {
        if(page == 1){
            self.movies.removeAll()
        }
        page += 1
        self.movies.append(contentsOf: movies)
        cvMovies.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (cvMovies.frame.size.width - space) / 2.0
        return CGSize(width: size, height: 270)
    }
    
    //MARK:-- UICollectionView implementation
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = movies[indexPath.row]
        let cell = cvMovies.dequeueReusableCell(withReuseIdentifier: "cell_movie", for: indexPath) as! CollectionViewCell
        cell.lbTitle.text = movie.title
        cell.lbVote.text = String(movie.vote_average)
        cell.lbRelease.text = movie.release_date
        if let poster = movie.poster_path{
            cell.ivPoster.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/"+poster))
        }
        cell.backgroundColor = .red
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        // check if i the last item
        if indexPath.row == movies.count - 1 {
            print("page: \(String(page))")
            presenter.makePlayingNowRequest(page: page)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMovie = movies[indexPath.row]
        performSegue(withIdentifier: "detail_segue", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail_segue" {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movieId = selectedMovie?.id
        }
    }
    
}

