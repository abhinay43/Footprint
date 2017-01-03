//
//  RefineTypesLayout.swift
//  Footprint
//
//  Created by Abhinay Maurya on 11/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class RefineTypesLayout: UICollectionViewFlowLayout
{

    var totalRows = RefinePageHelper.refineTypes.count
    
    // here we define the width of each cell, creating a 2 column layout. In case you would create 3 columns, change the number 2 to 3
    var itemWidth:CGFloat!{
        get{
            return (collectionView!.frame.width/(CGFloat(self.totalRows))-5)
        }
    }
    
    // here you can define the height of each cell
    var itemHeight:CGFloat!{
        get{
            let width =  itemWidth + RefineTypesCell.Constant.BottomViewHeight
            return width
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
        minimumInteritemSpacing = 5
        minimumLineSpacing = 5
        scrollDirection = .horizontal
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
