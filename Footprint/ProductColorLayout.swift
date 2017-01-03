//
//  ProductColorLayour.swift
//  Footprint
//
//  Created by Abhinay Maurya on 18/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ProductColorLayout: UICollectionViewFlowLayout
{
    fileprivate var totalColumn = 2
    fileprivate let distance:CGFloat = 5.0
    
    
    // here you can define the height of each cell
    var itemHeight:CGFloat!{
        get{
            return ProductColorCell.Constant.Height
        }
    }
    
    var itemWidth:CGFloat!{
        get{
            return (collectionView!.frame.width/(CGFloat(self.totalColumn)) - distance)
        }
    }
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    /**
     Sets up the layout for the collectionView. 1pt distance between each cell and 1pt distance between each row plus use a vertical layout
     */
    func setupLayout() {
        minimumInteritemSpacing = distance
        minimumLineSpacing = distance
        scrollDirection = .vertical
    }
    
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: itemWidth, height: itemHeight)
        }
        get {
            return CGSize(width:itemWidth, height: itemHeight)
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
    
    
    
}
