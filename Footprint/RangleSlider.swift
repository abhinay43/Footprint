//
//  RangleSlider.swift
//  Footprint
//
//  Created by Abhinay Maurya on 17/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit
import TTRangeSlider

class RangleSlider: TTRangeSlider
{

    

}

extension RangleSlider
{
    override func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
}
