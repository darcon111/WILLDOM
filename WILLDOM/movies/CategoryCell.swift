//
//  CategoryCell.swift
//  WILLDOM
//
//  Created by MacBook Pro on 30/9/21.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryTitle: UILabel!
    
    
    @IBOutlet weak var container: UIView!
    
    
    @IBOutlet weak var imgCategory: UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
}
