//
//  DetailMovieController.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import UIKit
import AlamofireImage

class DetailMovieController: UIViewController {
    
    var movie = MovieModel()
    
    @IBOutlet weak var movietitle: UILabel!
    
    @IBOutlet weak var subTitle: UITextView!
    
    @IBOutlet weak var imgMovie: UIImageView!
    
    @IBOutlet weak var movieVote: UILabel!
    
    @IBOutlet weak var movieDate: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.movietitle.text = movie.original_title
        self.subTitle.text = movie.overview
        
        self.imgMovie.af_setImage(
            withURL: URL(string:Config.url_image + (self.movie.poster_path)!)!
            //placeholderImage: UIImage(named: "TWITlogoSQ")
        )
        
        self.movieVote.text =  movie.vote_average?.description
        self.movieDate.text = movie.release_date
    }
    
    
    @IBAction func btnPlay(_ sender: Any) {
        
               
        let video = VideoRouter.createVideoModule()
        let id = String(movie.id!)
        video.idVideo = id
        
        self.present(video, animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
