//
//  ProductSizeCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 19/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ProductSizeCell: UICollectionViewCell
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var lblTitle: UILabel!
    
    //MARK:- Public var
    var data:String!{
        didSet{
            lblTitle.textColor = UIColor.darkGray
            lblTitle.text = data
            lblTitle.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 15.0)
        }
    }
    
    
}

/* ------------------------------ extension -------------------------- */

extension ProductSizeCell
{
    struct Constant{
        static let Identifier = "ProductSizeCell"
        static let Height:CGFloat = 44.0
    }
    
    static func registerNib (collectionView:UICollectionView){
        collectionView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellWithReuseIdentifier: Constant.Identifier)
    }
}

