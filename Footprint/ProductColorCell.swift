//
//  ProductColorCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 18/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ProductColorCell: UICollectionViewCell {

    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var lblTitle: UILabel!
    @IBOutlet fileprivate weak var lblColor: UILabel!
    
    //MARK:- Public var
    var data:ProductColorInfo!{
        didSet{
            lblTitle.textColor = UIColor.darkGray
            lblTitle.text = data.name
            lblTitle.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 15.0)
            lblColor.backgroundColor = data.color
        }
    }
    

}

/* ------------------------------ extension -------------------------- */

extension ProductColorCell
{
    struct Constant{
        static let Identifier = "ProductColorCell"
        static let Height:CGFloat = 44.0
    }
    
    static func registerNib (collectionView:UICollectionView){
        collectionView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellWithReuseIdentifier: Constant.Identifier)
    }
}

