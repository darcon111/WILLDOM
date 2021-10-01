//
//  Config.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import Foundation


class Config {
    // Dev
     static let urlDev = "https://api.themoviedb.org/3/"
    
    static let list_movies = "movie/"
    static let get_video = "movie/{id}/videos"
    
    static let popular = "popular"
    static let top_rated = "top_rated"
    static let upcoming = "upcoming"
    
    static let api_key = "1c4e72d810a89c8805c81a0c75028746"
     
     static let  access_token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYzRlNzJkODEwYTg5Yzg4MDVjODFhMGM3NTAyODc0NiIsInN1YiI6IjYxNGY0OGE0ZmI4MzQ2MDA4Y2NmYWE2ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ycb3b7MDuWblGTVmTnyJLbO7Ol-KzTjo3Qy1f8BRwXk"
    
    static let url_image = "https://image.tmdb.org/t/p/w500/"
    

    
    
    static func getUrlMovies() ->String
    {
        return urlDev + list_movies;
        
    }
    
    static func getApiKey() ->String
    {
        return "api_key=" + api_key
        
    }
    
}
