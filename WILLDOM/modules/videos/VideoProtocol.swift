//
//  VideoProtocol.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import Foundation

protocol ViewToPresenterVideoProtocol:class {
    
    var view: PresenterToViewVideoProtocol? {get set}
    var interactor: PresenterToInteractorVideoProtocol? {get set}
    var router: PresenterToRouterVideoProtocol? {get set}
    func getUrlVideo(id:String)

}

protocol PresenterToViewVideoProtocol:class {
    
    func onVideoResponseSuccess(videoArrayList:Array<VideoModel>)
    func onVideoResponseFailed(error:String)
    
}

protocol PresenterToRouterVideoProtocol:class {
    
    static func createVideoModule()->VideoPlayController

}

protocol PresenterToInteractorVideoProtocol:class {
    
    var presenter:InteractorToPresenterVideoProtocol? {get set}
    func getUrlVideo(id:String)
    
}

protocol InteractorToPresenterVideoProtocol:class {
    
    func videoFetchSuccess(videoList:Array<VideoModel>)
    func videoFetchFailed()
    
}

