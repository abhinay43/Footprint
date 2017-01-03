//
//  RefineSubTypesCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 11/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

protocol  RefineSubTypesDelegate {
    func refineAction(index:Int)
}

class RefineSubTypesCell: UICollectionViewCell
{

    //MARK:- IBOutlets
    @IBOutlet fileprivate weak var lblTitle:UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        lblTitle.textColor = FootprintConstant.Color.FootprintGreenColor
        lblTitle.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 13.0)
    }
    
    //MARK:- Public Var
    var title:String!{
        didSet{
            lblTitle.text = title.uppercased()
        }
    }
    
    
}
/* ------------------------------ extension -------------------------- */

extension RefineSubTypesCell
{
    struct Constant{
        static let Identifier = "RefineSubTypesCell"
    }
    
    static func registerClass (collectionView:UICollectionView){
        collectionView.register(RefineSubTypesCell.self, forCellWithReuseIdentifier: Constant.Identifier)
    }
    
    static func registerNib (collectionView:UICollectionView){
        collectionView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellWithReuseIdentifier: Constant.Identifier)
    }
}
