//
//  CornerRadiusView.swift
//  Footprint
//
//  Created by Abhinay Maurya on 03/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

@IBDesignable class CornerRadiusView: UIView
{
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = FootprintConstant.CornerRadius.Default
        self.layer.masksToBounds = true
    }
    

}
