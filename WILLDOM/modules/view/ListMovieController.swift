//
//  ListMovieController.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import UIKit
import Randient
import AlamofireImage
import MaterialComponents


class ListMovieController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var ListCategory: UICollectionView!
    @IBOutlet weak var nav: UINavigationBar!
    @IBOutlet weak var ListMovie: UICollectionView!
    var nameCategory = Array<String>()
    var arrayMovies = Array<MovieModel>()
    var arrayMoviesReal = Array<MovieModel>()
    
    
    var moviePresenter:ViewToPresenterMovieProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nav.layer.masksToBounds = false
        self.nav.layer.shadowColor = UIColor.lightGray.cgColor
        self.nav.layer.shadowOpacity = 0.8
        self.nav.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        self.nav.layer.shadowRadius = 1
        
        self.nameCategory.append(Config.popular)
        self.nameCategory.append(Config.top_rated)
        self.nameCategory.append(Config.upcoming)

        
        self.ListMovie.reloadData()
        
        self.searchBar.delegate = self
        

        moviePresenter?.startFetchingMovie()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         if #available(iOS 13.0, *) {
              navigationController?.navigationBar.setNeedsLayout()
         }
    }
    


}

extension ListMovieController:PresenterToViewMovieProtocol{
    
    func onMovieResponseSuccess(movieModelArrayList: Array<MovieModel>) {
        
        self.arrayMovies.removeAll()
        
        self.arrayMovies = movieModelArrayList
        self.arrayMoviesReal = movieModelArrayList
        self.ListMovie.reloadData()
        
   
    }
    
    func onMovieResponseFailed(error: String) {
        
        self.alert(message: error)
    }
    
    
}



extension ListMovieController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate, UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         
        if !searchText.isEmpty {
            
            self.arrayMovies.removeAll()
            
            self.arrayMoviesReal.forEach { row in
                if (row.original_title!.lowercased().contains(searchText.lowercased())) {
                    
                    self.arrayMovies.append(row)
                }
            }
            
        }else {
            
            self.arrayMovies = self.arrayMoviesReal
            
        }
        
        self.ListMovie.reloadData()
       
        }

        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
         
            self.arrayMovies = self.arrayMoviesReal
            
            self.ListMovie.reloadData()
        }
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.ListCategory{
            return self.nameCategory.count
        }else {
 
                return self.arrayMovies.count
            
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.ListCategory{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.categoryTitle.text = self.nameCategory[indexPath.row].uppercased()
            cell.imgCategory.image = UIImage(named:  self.nameCategory[indexPath.row])
            
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
            
            let row = self.arrayMovies[indexPath.row]
            
            cell.movieTitle.text = row.title

            let filter = AspectScaledToFillSizeFilter(size: cell.frame.size)
            
            cell.imgMovie.af_setImage(
                withURL: URL(string:Config.url_image + row.poster_path!)!,filter:filter
            )
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.ListCategory {
            self.moviePresenter?.findCategory(type: self.nameCategory[indexPath.row])
        }else{
                        
            let vc = (
                storyboard?.instantiateViewController(
                    withIdentifier: "DetailMovieController") as! DetailMovieController
                )
            
            let row = self.arrayMovies[indexPath.row]
                
            vc.movie = row
            
            let shapeScheme = MDCShapeScheme()
            shapeScheme.largeComponentShape = MDCShapeCategory(cornersWith: .rounded, andSize: 8)

          
            
            let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
            
            MDCBottomSheetControllerShapeThemer.applyShapeScheme(shapeScheme, to: bottomSheet)

            bottomSheet.dismissOnDraggingDownSheet = false
            
            bottomSheet.preferredContentSize = CGSize(width: self.view.frame.size.width, height: 250)

            present(bottomSheet, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 3
        

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        
        var height = size
        
        if collectionView == self.ListMovie {
            
            height = size + 60
        }
        
        
        
        return CGSize(width: size, height: height)
        
    }
}


