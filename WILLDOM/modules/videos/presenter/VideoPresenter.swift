//
//  VideoPresenter.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import Foundation

class VideoPresenter:ViewToPresenterVideoProtocol{
    
    var view: PresenterToViewVideoProtocol?
    
    var interactor: PresenterToInteractorVideoProtocol?
    
    var router: PresenterToRouterVideoProtocol?
    
    func getUrlVideo(id:String) {
        interactor?.getUrlVideo(id: id)
    }
    
    
    

    
}

extension VideoPresenter:InteractorToPresenterVideoProtocol{
    
    
    
    func videoFetchSuccess(videoList:Array<VideoModel>){
        view?.onVideoResponseSuccess(videoArrayList: videoList)
        
    }
    func videoFetchFailed(){
        
        view?.onVideoResponseFailed(error: "Some Error message from api response")
    }
    

    
    
}


