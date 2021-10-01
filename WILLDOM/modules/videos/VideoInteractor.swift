//
//  VideoInteractor.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import Foundation
import Alamofire
import ObjectMapper


class VideoInteractor:PresenterToInteractorVideoProtocol{
    
    
    var presenter: InteractorToPresenterVideoProtocol?
    
    
    func getUrlVideo(id:String){
        
        
        //https://api.themoviedb.org/3/movie/631843/videos?api_key=1c4e72d810a89c8805c81a0c75028746&language=en-US&page=1
        
        let search = Config.get_video.replacingOccurrences(of: "{id}", with: id)
        
        Alamofire.request(Config.urlDev + search + "?api_key=" + Config.api_key, method: .get, encoding: JSONEncoding.default)
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        
                        if let json = value as? [String: Any] {
                            
                            let array = json["results"] as! NSArray
                            
                            let arrayObject = Mapper<VideoModel>().mapArray(JSONArray: array as! [[String : Any]]);
                            
                            
                            self.presenter?.videoFetchSuccess(videoList: arrayObject)
                            
                        }else{
                            
                            self.presenter?.videoFetchFailed()
                            
                        }
                    case .failure(let error):
                        self.presenter?.videoFetchFailed()
                    }
            }
        
        
    }
    
    
    
    
}

