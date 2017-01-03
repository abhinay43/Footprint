//
//  STLProductCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 17/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class STLProductCell: UICollectionViewCell
{

    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var imgProduct: UIImageView!
    
    //MARK:- Public Var
    var data:String!{
        didSet{
            imgProduct.image = UIImage(named: data)
        }
    }
    
    //MARK:-
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgProduct.drawBorder(cornerRadius: self.frame.size.width/2.0, borderWidth: 1.0, borderColor: WhiteColor, maskToBound: true)
    }

}
/* ------------------------------ extension -------------------------- */

extension STLProductCell
{
    struct Constant{
        static let Identifier = "STLProductCell"
    }
    
    static func registerNib (collectionView:UICollectionView){
        collectionView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellWithReuseIdentifier: Constant.Identifier)
    }
}
