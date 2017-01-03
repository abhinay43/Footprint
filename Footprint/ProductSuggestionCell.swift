//
//  ProductSuggestionCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 22/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ProductSuggestionCell: UICollectionViewCell
{

    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var imgMedia: UIImageView!
    
    //MARK:- Public var
    var media:String!{
        didSet{
            if let image = UIImage(named:media){
                imgMedia.image = image
            }
        }
    }
    
    //MARK:- 
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Constant.BGColor
    }
    
}

/* ------------------------------ extension -------------------------- */

extension ProductSuggestionCell
{
    struct Constant{
        static let Identifier = "ProductSuggestionCell"
        static let BGColor = UIColor(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
    }
    
    static func registerNib (collectionView:UICollectionView){
        collectionView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellWithReuseIdentifier: Constant.Identifier)
    }
}
