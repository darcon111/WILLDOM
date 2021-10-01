//
//  MovieRouter.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import Foundation
import UIKit

class MovieRouter:PresenterToRouterMovieProtocol{
    
    static func createMovieModule() -> ListMovieController {
        
        let view = MovieRouter.mainstoryboard.instantiateViewController(withIdentifier: "ListMovieController") as! ListMovieController
        
        let presenter: ViewToPresenterMovieProtocol & InteractorToPresenterMovieProtocol = MoviePresenter()
        let interactor: PresenterToInteractorMovieProtocol = MovieInteractor()
        let router:PresenterToRouterMovieProtocol = MovieRouter()
        
        view.moviePresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    
}

