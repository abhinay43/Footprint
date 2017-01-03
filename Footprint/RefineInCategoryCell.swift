//
//  RefineInCategoryCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 12/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class RefineInCategoryCell: UICollectionViewCell
{

    //MARK:- IBOutlets
    @IBOutlet fileprivate weak var lblTitle:UILabel!
    
    //MARK:-
    override func awakeFromNib()
    {
        super.awakeFromNib()
        lblTitle.textColor = WhiteColor
        lblTitle.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 13.0)
        lblTitle.drawBorder(cornerRadius: 3.0, borderWidth: 1.0, borderColor: WhiteColor, maskToBound: true)
    }
    
    
    
    //MARK:- Public Var
    var title:String!{
        didSet{
            lblTitle.text = title.uppercased()
        }
    }
    
    override var isSelected: Bool{
        didSet{
            if isSelected{
                self.backgroundColor = FootprintConstant.Color.FootprintGreenColor
            }else{
                self.backgroundColor = ClearColor
            }
        }
    }
    
}
/* ------------------------------ extension -------------------------- */

extension RefineInCategoryCell
{
    struct Constant{
        static let Identifier = "RefineInCategoryCell"
    }
    
    static func registerClass (collectionView:UICollectionView){
        collectionView.register(RefineInCategoryCell.self, forCellWithReuseIdentifier: Constant.Identifier)
    }
    
    static func registerNib (collectionView:UICollectionView){
        collectionView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellWithReuseIdentifier: Constant.Identifier)
    }
}
