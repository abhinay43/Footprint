//
//  ProductSuggestionView.swift
//  Footprint
//
//  Created by Abhinay Maurya on 22/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

protocol ProductSuggestionDelegate {
    func selected(product:Product)
}


class ProductSuggestionView: UIView
{
    //MARK:- Private Vars
    fileprivate var dataSource = [Product]()
    fileprivate var bgColor = WhiteColor
    fileprivate var collectionView:UICollectionView?
    fileprivate var title = ""
    
    //MARK:- Public Var
    var delegate:ProductSuggestionDelegate?
    
    //MARK:- View Life Cycle
    init(frame:CGRect, bGColor:UIColor?, title:String!, dataSource:[Product]){
        super.init(frame: frame)
        
        self.frame = frame
        self.dataSource = dataSource
        self.title = title
        
        if let bgColor = bGColor{
            self.bgColor = bgColor
        }
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Private Metods
    fileprivate func setUp()
    {
        if dataSource.count <= 0{
            return
        }
        
        var yPos:CGFloat = 0.0
        
        let lblTitle = UILabel(frame: CGRect(x: 0, y: yPos, width: self.bounds.size.width, height: Constant.TitleHeight))
        lblTitle.textColor = DarkGray
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 21.0)
        lblTitle.backgroundColor = ClearColor
        lblTitle.text = title.uppercased()
        
        self.addSubview(lblTitle)
        
        yPos += Constant.TitleHeight + Constant.Gap
        let xPos:CGFloat = 15.0
        
        collectionView  = UICollectionView(frame: CGRect(x: xPos, y: yPos, width: self.bounds.size.width - xPos * 2, height: Constant.CollectionViewHeight), collectionViewLayout: ProductSuggestionLayout())
        collectionView!.backgroundColor = ClearColor
        ProductSuggestionCell.registerNib(collectionView: collectionView!)
        collectionView?.canCancelContentTouches = false
        
        //collectionView!.delegate  = self
        collectionView!.dataSource = self
        collectionView!.panGestureRecognizer.cancelsTouchesInView = true
        self.addSubview(collectionView!)
        
        yPos += Constant.CollectionViewHeight + Constant.Gap
       
    }

}
/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension


extension ProductSuggestionView
{
    struct Constant{
        static let CollectionViewHeight:CGFloat =  100.0
        static let TitleHeight:CGFloat = 40.0
        static let Gap:CGFloat = 10.0
    }
}


extension ProductSuggestionView:UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        delegate?.selected(product:dataSource[indexPath.row])
    }
    
}

extension ProductSuggestionView:UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductSuggestionCell.Constant.Identifier, for: indexPath) as! ProductSuggestionCell
        cell.media = dataSource[indexPath.row].imageURL
        return cell
    }
    
}
