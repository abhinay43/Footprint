//
//  PlusHeaderView.swift
//  Footprint
//
//  Created by Abhinay Maurya on 09/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

protocol PlusHeaderViewDelegate {
    func headerTappedForSection(section:Int)
}

class PlusHeaderView: UIView
{

    //MARK:- Private Vars
    
    
    //MARK:- IBoutlet
    @IBOutlet fileprivate weak var lblTitle: UILabel!
    @IBOutlet fileprivate weak var lblSeperator: UILabel!
    
    var title:String! {
        didSet{
            lblTitle.text = title
        }
    }
    
    //MARK:- Public Var
    
    var delegate:PlusHeaderViewDelegate?
    
    var isTitleSelected = false{
        didSet{
            if isTitleSelected{
                lblTitle.textColor = Constant.SelectedColor
            }else{
                lblTitle.textColor = UIColor.white
            }
           
        }
    }
    
    //MARK:- IBAction
    @IBAction fileprivate func tappedAction(_ sender: AnyObject)
    {
        if let delegate = delegate
        {
            if isTitleSelected == false{
                delegate.headerTappedForSection(section: self.tag)
                //isTitleSelected = true
            }else{
                delegate.headerTappedForSection(section: -1)
                //isTitleSelected = false
            }
            
        }
    }
}

//MARK:- Extension
extension PlusHeaderView
{
    struct Constant {
        static let SelectedColor = UIColor(red: 121.0/255.0, green: 135.0/255.0, blue: 134.0/255.0, alpha: 1.0)
        static let Height:CGFloat = 65.0
    }
    
    //MARK:- Static Metod
    static func instantiate() -> PlusHeaderView{
        let views = Bundle.main.loadNibNamed("PlusHeaderView", owner: self, options: nil)
        return views![0] as! PlusHeaderView
        
    }
    
}
