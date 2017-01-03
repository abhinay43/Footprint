//
//  ImageContainerView.swift
//  Footprint
//
//  Created by Abhinay Maurya on 22/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ImageContainerView: UIView
{

    //MARK:- Private Vars
    fileprivate var imageUrl:String?
    fileprivate var imageView = UIImageView()
    fileprivate let gap:CGFloat = 44.0
    
    //MARK:- View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    init(frame:CGRect, bGColor:UIColor?, imageURL:String?){
        super.init(frame: frame)
        
        self.frame = frame
        self.imageUrl = imageURL
        self.backgroundColor = bGColor
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- Private Metods
    fileprivate func setUp()
    {
        guard let imageUrl = imageUrl else {
            return
        }
        
        guard let image = UIImage(named:imageUrl) else {
            return
        }
        imageView.frame = CGRect(x: frame.origin.x, y: gap, width: frame.size.width, height: frame.size.height - 2*gap)
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
    }

}
