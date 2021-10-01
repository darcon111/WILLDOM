//
//  MovieProtocol.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import Foundation

protocol ViewToPresenterMovieProtocol:class {
    
    var view: PresenterToViewMovieProtocol? {get set}
    var interactor: PresenterToInteractorMovieProtocol? {get set}
    var router: PresenterToRouterMovieProtocol? {get set}
    func startFetchingMovie()
    func findCategory(type:String)

}

protocol PresenterToViewMovieProtocol:class {
    
    func onMovieResponseSuccess(movieModelArrayList:Array<MovieModel>)
    func onMovieResponseFailed(error:String)
    
}

protocol PresenterToRouterMovieProtocol:class {
    
    static func createMovieModule()->ListMovieController

}

protocol PresenterToInteractorMovieProtocol:class {
    
    var presenter:InteractorToPresenterMovieProtocol? {get set}
    func fetchMovie(type:String)
    
}

protocol InteractorToPresenterMovieProtocol:class {
    
    func movieFetchSuccess(movieList:Array<MovieModel>)
    func movieFetchFailed()

    
}

