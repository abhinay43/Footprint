//
//  HeaderView.swift
//  Footprint
//
//  Created by Abhinay Maurya on 09/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

@IBDesignable class HeaderView: UIView
{
    
    @IBInspectable var Title:String = Config.AppName{
        didSet{
            if lblTitle != nil {
                lblTitle.text = Title
            }
        }
    }
    
    fileprivate var lblTitle:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    private func setUp ()
    {
        let windowFrame = UIScreen.main.bounds
        let frame = CGRect(x: 0, y: 14, width: windowFrame.width, height: 50.0)
        lblTitle               = UILabel(frame: frame)
        lblTitle.text          = Title
        lblTitle.textColor     = UIColor.white
        lblTitle.textAlignment = .center
        lblTitle.font          = UIFont(name: FootprintConstant.Font.Montserrat.FamilyName, size: Constant.FontSize)
        self.addSubview(lblTitle)
    }
    
    
}

extension HeaderView{
    struct Constant{
        static let FontSize:CGFloat = 21.0
    }
    
}
