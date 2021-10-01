//
//  MovieInteractor.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import Foundation
import Alamofire
import ObjectMapper


class MovieInteractor:PresenterToInteractorMovieProtocol{
    
    var presenter: InteractorToPresenterMovieProtocol?
    
    func fetchMovie(type:String) {
        
        let request = URLRequest(url: URL(string: Config.getUrlMovies() + type+"?api_key="+Config.api_key)!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 100)
        
        /*Alamofire.request(request)
           .response { (data) in
               self.refreshControl?.endRefreshing()
               if let data = data.data {
                   let json = try? JSON(data: data)
               }
           }*/
        
        
        Alamofire.request(request)
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        
                        if let json = value as? [String: Any] {
                            
                            let array = json["results"] as! NSArray
                            
                            let arrayObject = Mapper<MovieModel>().mapArray(JSONArray: array as! [[String : Any]]);
                            self.presenter?.movieFetchSuccess(movieList: arrayObject)
                            
                        }else{
                            
                            self.presenter?.movieFetchFailed()
                            
                        }
                    case .failure(let error):
                        self.presenter?.movieFetchFailed()
                    }
            }
        
    
        
    }
    

    
    
    
    
}
