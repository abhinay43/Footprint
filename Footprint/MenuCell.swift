//
//  MenuCell.swift
//  VSearch
//
//  Created by Abhinay Maurya on 15/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

open class MenuCell : UITableViewCell
{
    ///MARK:- IBOutlet
    @IBOutlet fileprivate weak var lblTitle: UILabel!
    @IBOutlet fileprivate weak var lblImage: UILabel!
    @IBOutlet fileprivate weak var lblSeperator: UILabel!
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
        open override func awakeFromNib() {
    }
    
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            self.alpha = 0.4
        } else {
            self.alpha = 1.0
        }
    }
    
    // ignore the default handling
    override open func setSelected(_ selected: Bool, animated: Bool) {
    }
    
    
    
    //MARK:- Private
    fileprivate func setup() {
    }
    
    //MARK:- Public vars
    var data:LeftMenuRecord!{
        didSet{
            backgroundColor = ClearColor
            lblTitle?.text = data.title.uppercased()
            lblImage?.text = data.imageName
            
            lblTitle?.textColor = WhiteColor
            lblImage?.textColor = WhiteColor
            //lblSeperator?.backgroundColor = FootprintConstant.Color.FootprintBlueColor
            
        }
    }
    
    
}

/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension

extension MenuCell
{
    struct Constant {
        static let Identifier = "MenuCell"
        static let Height = 48.0
    }
    
}
