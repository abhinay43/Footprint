//
//  FaqsCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 13/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

protocol FaqsCellDelegate {
     func closeSection(section:Int)
}

class FaqsCell: UITableViewCell
{

    //MARK:- IBoutlet
    @IBOutlet fileprivate weak var txtTACDescription: UITextView!
    @IBOutlet fileprivate weak var txtIndemnDescription: UITextView!
    
    @IBOutlet fileprivate weak var layoutConstraintTxtIndeHeight: NSLayoutConstraint!
    @IBOutlet fileprivate weak var layoutConstraintTxtTACHeight: NSLayoutConstraint!
    
    //MARK:- Public Record
    
    var delegate:FaqsCellDelegate?
    
    var data:PlusRecord!{
        didSet{
            txtTACDescription.text = data.descriptionFirst
            txtIndemnDescription.text = data.descriptionSecond
            
            
            let font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: Constant.FontSize)
            let screenBounds = UIScreen.main.bounds
            let width = screenBounds.size.width - (2 * Constant.LeftRightAlign)
            
            txtTACDescription.font = font
            txtIndemnDescription.font = font
            
            let textDes1Height =  data.descriptionFirst.heightWithConstrainedWidth(width: width, font: font!) + Constant.ExtraGapInTextView
            layoutConstraintTxtTACHeight.constant = textDes1Height
            
            let textDes2Height =  data.descriptionSecond.heightWithConstrainedWidth(width: width, font: font!) + Constant.ExtraGapInTextView
            layoutConstraintTxtIndeHeight.constant = textDes2Height
            
        }
    }
    
     //MARK:-
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK:- IBAction
    @IBAction func closeTheCell(_ sender: UIButton) {
        if let delegate = delegate{
            delegate.closeSection(section: self.tag)
        }
    }
    
     //MARK:-
    //var record:
    
    class func getCellHeight (data:PlusRecord) -> CGFloat
    {
        let screenBounds = UIScreen.main.bounds
        let font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: Constant.FontSize)
        let width = screenBounds.size.width - (2 * Constant.LeftRightAlign)
        
        
        let textDes1Height =  data.descriptionFirst.heightWithConstrainedWidth(width: width, font: font!) + Constant.ExtraGapInTextView
        let textDes2Height =  data.descriptionFirst.heightWithConstrainedWidth(width: width, font: font!) + Constant.ExtraGapInTextView
        
        return Constant.CellOtherContentHeight + textDes1Height + textDes2Height
    }
    
}

//MARK:- Extension
extension FaqsCell
{
    struct Constant{
        static let Identifier = "FaqsCell"
        static let FontSize:CGFloat = 12.0
        static let LeftRightAlign:CGFloat = 12.0
        static let ExtraGapInTextView:CGFloat = 10.0
        static let CellOtherContentHeight:CGFloat = 162.0
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }
}
