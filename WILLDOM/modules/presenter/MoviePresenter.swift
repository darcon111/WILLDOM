//
//  MoviePresenter.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import Foundation

class MoviePresenter:ViewToPresenterMovieProtocol{
    
    
    
    var view: PresenterToViewMovieProtocol?
    
    var interactor: PresenterToInteractorMovieProtocol?
    
    var router: PresenterToRouterMovieProtocol?
    
    func startFetchingMovie() {
        interactor?.fetchMovie(type: Config.popular)
    }
    
    
    func findCategory(type: String) {
        interactor?.fetchMovie(type: type)
    }
    

    
}

extension MoviePresenter:InteractorToPresenterMovieProtocol{
    
    
    func movieFetchSuccess(movieList: Array<MovieModel>) {
        view?.onMovieResponseSuccess(movieModelArrayList: movieList)
    }
    
    func movieFetchFailed() {
        view?.onMovieResponseFailed(error: "Some Error message from api response")
    }
    
    
}

