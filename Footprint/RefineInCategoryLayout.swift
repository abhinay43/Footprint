//
//  RefineInCategoryLayout.swift
//  Footprint
//
//  Created by Abhinay Maurya on 12/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class RefineInCategoryLayout: UICollectionViewFlowLayout
{
    var totalColumns = 3
    let totalRows = 2
    
    // here we define the width of each cell, creating a 2 column layout. In case you would create 3 columns, change the number 2 to 3
    var itemWidth:CGFloat!{
        get{
            return (collectionView!.frame.width/(CGFloat(self.totalColumns))-10)
        }
    }
    
    // here you can define the height of each cell
    var itemHeight:CGFloat!{
        get{
            let height =  (collectionView!.frame.height/(CGFloat(self.totalRows))-10)
            return height
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
     Sets up the layout for the collectionView. 10pt distance between each cell and 10pt distance between each row plus use a vertical layout
     */
    func setupLayout() {
        minimumInteritemSpacing = 10
        minimumLineSpacing = 10
        sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        scrollDirection = .vertical
    }
    
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: itemWidth, height: itemHeight)
        }
        get {
            print(itemWidth)
            return CGSize(width:itemWidth, height: itemHeight)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]?
    {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        for attribute in attributes!
        {
            switch attribute.indexPath.section
            {
                case 0:
                        attribute.frame = CGRect(x: attribute.frame.origin.x + itemWidth/2, y: 0, width: itemWidth, height: itemHeight)
                        break
                default:
                        break
            }
            
        }
        
        return attributes
    }
    
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
    
}
