//
//  ProductShareCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 19/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ProductShareCell: UICollectionViewCell
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
}

/* ------------------------------ extension -------------------------- */

extension ProductShareCell
{
    struct Constant{
        static let Identifier = "ProductShareCell"
        static let Width:CGFloat = 30.0
    }
    
    static func registerNib (collectionView:UICollectionView){
        collectionView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellWithReuseIdentifier: Constant.Identifier)
    }
}

