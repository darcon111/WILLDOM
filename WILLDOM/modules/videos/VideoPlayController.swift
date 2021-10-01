//
//  VideoPlayController.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import UIKit
import YouTubePlayer

class VideoPlayController: UIViewController {
    
    @IBOutlet var videoPlayer: YouTubePlayerView!
    
    var videoPresenter:ViewToPresenterVideoProtocol?
    
    var array =  Array<VideoModel>()
    
    var idVideo : String = ""
    
    @IBOutlet weak var nav: UINavigationBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        videoPresenter?.getUrlVideo(id: idVideo)
        
        
        
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        
        self.dismiss(animated:true)
    }
    

   

}

extension VideoPlayController:PresenterToViewVideoProtocol{
   
    
    
    func onVideoResponseFailed(error: String) {
        self.alert(message: error)
        self.dismiss(animated: true)
    
    }
    
    

    
    
    
    func onVideoResponseSuccess(videoArrayList: Array<VideoModel>) {
        
        array = videoArrayList
        if videoArrayList.count>0 {
            
            videoPlayer.loadVideoID(array[0].key!)
            videoPlayer.play()
            nav.topItem?.title = array[0].name
        }else {
            
            self.alert(message: "Video no found error")
        }
       
    }
    
    
}

