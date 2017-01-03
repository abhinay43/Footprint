//
//  ProductShareLayout.swift
//  Footprint
//
//  Created by Abhinay Maurya on 19/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ProductShareLayout: UICollectionViewFlowLayout
{
    
    static let gap:CGFloat = 20.0
    
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
        minimumInteritemSpacing = ProductShareLayout.gap
        minimumLineSpacing = ProductShareLayout.gap
        scrollDirection = .horizontal
    }
    
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: ProductShareCell.Constant.Width, height: ProductShareCell.Constant.Width)
        }
        get {
            return CGSize(width: ProductShareCell.Constant.Width, height: ProductShareCell.Constant.Width)
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
    
    
    
}
