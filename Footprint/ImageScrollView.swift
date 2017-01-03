//
//  ImageScrollView.swift
//  Footprint
//
//  Created by Abhinay Maurya on 22/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ImageScrollView: UIScrollView
{
    //MARK:- Private Vars
    fileprivate var contentYPos:CGFloat = 0.0
    fileprivate var bgColor = WhiteColor
    fileprivate var contentYPosBeforeYouMayLike :CGFloat = 0.0
    
    var dataSource:[Product]?{
        didSet{
            if let bgColor = backgroundColor{
                self.bgColor = bgColor
            }
            setUp()
        }
    }
    
    var dataSourceProductSuggestion:[Product]?{
        didSet{
            setUpProductSuggestion()
        }
    }
    
    
    fileprivate func setUp()
    {
        self.isPagingEnabled = true
        self.alwaysBounceVertical = false
        self.alwaysBounceHorizontal = false
        self.delegate = self
        for data in dataSource!{
            var imageContainerframe = frame
            imageContainerframe.origin.y = contentYPos
            
            let view = ImageContainerView(frame: imageContainerframe, bGColor: bgColor, imageURL: data.imageURL)
            self.addSubview(view)
            contentYPos += bounds.size.height
        }
        contentYPosBeforeYouMayLike = contentYPos - bounds.size.height
        self.contentSize = CGSize(width: frame.size.width, height: contentYPos)
    }
    
    fileprivate func setUpProductSuggestion()
    {
        if let dataSource = dataSourceProductSuggestion
        {
            var productSuggestionframe = frame
            productSuggestionframe.origin.y = contentYPos
            productSuggestionframe.size.height = ProductSuggestionView.Constant.CollectionViewHeight +  ProductSuggestionView.Constant.TitleHeight + 2 * ProductSuggestionView.Constant.Gap
            
            let view = ProductSuggestionView(frame: productSuggestionframe, bGColor: WhiteColor, title: "We may suggest", dataSource: dataSource)
            self.addSubview(view)
            contentYPos += productSuggestionframe.size.height
        }
        
        self.contentSize = CGSize(width: frame.size.width, height: contentYPos)
    }
    

}

//MARK:- Extension UIScrollViewDelegate

extension ImageScrollView:UIScrollViewDelegate
{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.bounds.size.height){
            scrollView.contentOffset.y = scrollView.contentSize.height - scrollView.bounds.size.height
            scrollView.isPagingEnabled = false
        }else{
            scrollView.isPagingEnabled = true
        }
    }
}

