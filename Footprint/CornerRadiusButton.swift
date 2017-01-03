//
//  CornerRadiusButton.swift
//  Footprint
//
//  Created by Abhinay Maurya on 03/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//
/*
With the release of Xcode 6, Apple introduced a new feature known as IBDesignable and IBInspectable for developers to build custom controls and allowed us to live preview the design right in the Interface Builder.
 
 */

import UIKit

@IBDesignable class CornerRadiusButton: UIButton {

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = FootprintConstant.CornerRadius.Default
        self.layer.masksToBounds = true
    }
}
