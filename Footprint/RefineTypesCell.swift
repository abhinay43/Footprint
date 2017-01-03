//
//  RefineTypesCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 11/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

protocol  RefineTypesDelegate {
    func refineAction(index:Int)
}

class RefineTypesCell: UICollectionViewCell
{
    
    //MARK:- IBOutlets
    @IBOutlet fileprivate weak var lblTitle:UILabel!
    @IBOutlet fileprivate weak var btnRefine:UIButton!
    
    
    //MARK:- Public Var
    var data:RefineType!{
        didSet{
            lblTitle.text = data.title.uppercased()
            if let selectedTitle = data.selectedTitle{
                changeImageToTitle = selectedTitle
            }else{
                self.addImage()
            }
           
        }
    }
    
    var delegate:RefineTypesDelegate?
    
    var isItemSelected = false{
        didSet{
            btnRefine.backgroundColor = FootprintConstant.Color.FootprintGreenColor
        }
    }
    
    var changeImageToTitle:String!{
        didSet{
            btnRefine.setImage(nil, for: .normal)
            btnRefine.setTitle(changeImageToTitle, for: .normal)
            btnRefine.backgroundColor = FootprintConstant.Color.FootprintGreenColor
        }
    }
    
    
    
    //MARK:-
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnRefine.drawBorder(cornerRadius: btnRefine.frame.size.width/2.0, borderWidth: 1.0, borderColor: WhiteColor, maskToBound: true)
        lblTitle.textColor = FootprintConstant.Color.FootprintGreenColor
        lblTitle.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 11.0)
    }
    
   
    func addImage(){
        btnRefine.setTitle("", for: .normal)
        btnRefine.setImage(UIImage(named: data.imageName)!, for: .normal)
        btnRefine.backgroundColor = ClearColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
         btnRefine.drawBorder(cornerRadius: btnRefine.frame.size.width/2.0, borderWidth: 1.0, borderColor: WhiteColor, maskToBound: true)
    }
    
    //MARK:- IBAction
    @IBAction fileprivate func refineAction(){
        delegate?.refineAction(index: self.tag)
    }
    
}
/* ------------------------------ extension -------------------------- */

extension RefineTypesCell
{
    struct Constant{
        static let Identifier = "RefineTypesCell"
        static let BottomViewHeight:CGFloat = 25.0
    }
    
    static func registerClass (collectionView:UICollectionView){
        collectionView.register(RefineTypesCell.self, forCellWithReuseIdentifier: Constant.Identifier)
    }
    
    static func registerNib (collectionView:UICollectionView){
        collectionView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellWithReuseIdentifier: Constant.Identifier)
    }
}
