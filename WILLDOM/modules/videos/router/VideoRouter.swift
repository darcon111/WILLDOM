//
//  VideoRouter.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import Foundation
import UIKit

class VideoRouter:PresenterToRouterVideoProtocol{
    
    
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    static func createVideoModule() -> VideoPlayController {
        
        let view = MovieRouter.mainstoryboard.instantiateViewController(withIdentifier: "VideoPlayController") as! VideoPlayController
        
        let presenter: ViewToPresenterVideoProtocol & InteractorToPresenterVideoProtocol = VideoPresenter()
        let interactor: PresenterToInteractorVideoProtocol = VideoInteractor()
        let router:PresenterToRouterVideoProtocol = VideoRouter()
        
       // view.idVideo = idVideo
        
        view.videoPresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.modalPresentationStyle = .fullScreen
        
        return view
        
    }
    
}

