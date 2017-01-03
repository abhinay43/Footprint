//
//  BlogCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 03/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class BlogCell: UITableViewCell
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var imgHeader:UIImageView!
    @IBOutlet fileprivate weak var lblTitle:UILabel!
    @IBOutlet fileprivate weak var lblDescription:UILabel!
    @IBOutlet fileprivate weak var btnComments:UIButton!
    @IBOutlet fileprivate weak var lblTime:UILabel!
    @IBOutlet fileprivate weak var lblCategory:UILabel!
    
    @IBOutlet fileprivate weak var viewCategory: UIView!
    @IBOutlet fileprivate weak var viewBottom: UIView!
    
    //MARK:- Public Var

    var data:Blog!{
        didSet{
            lblTitle.text = data.title.uppercased()
            lblTime.text = data.time
            lblDescription.text = data.blogDescription
            if let imageName = data.imageUrl{
                imgHeader.image = UIImage(named: imageName)
            }
            let font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 14.0)
            
            if let comments = data.comments
            {
                let comments = "Comments (\(comments.count))"
                let commentSring = NSMutableAttributedString(string: comments, attributes: [NSFontAttributeName:font!])
                commentSring.addAttribute(NSForegroundColorAttributeName, value: DarkGray, range: NSRange(location:0, length:8))
                
                btnComments.setAttributedTitle(commentSring, for: .normal)
            }
            
            let category = "Categories: \(data.category!)"
            let categorySring = NSMutableAttributedString(string: category, attributes: [NSFontAttributeName:font!])
            categorySring.addAttribute(NSForegroundColorAttributeName, value: DarkGray, range: NSRange(location:0, length:11))
            
            lblCategory.attributedText = categorySring
            
        }
    }
    
    
    //MARK:-
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        let font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 14.0)
        
        lblTitle.font = UIFont(name: FootprintConstant.Font.Montserrat.Solid, size: 21.0)
        lblTime.font = font
        lblDescription.font = font
        lblCategory.font = font
        btnComments.titleLabel?.font = font
        
        lblTitle.textColor = DarkGray
        lblTime.textColor = DarkGray
        lblDescription.textColor = DarkGray
        lblCategory.textColor = BlackColor
        
        imgHeader.contentMode = .scaleAspectFill
        
        self.backgroundColor = ClearColor
        viewCategory.backgroundColor = UIColor(red: 208.0/255.0, green: 208.0/255.0, blue: 208.0/255.0, alpha: 1.0)
        viewBottom.backgroundColor = ClearColor
        
    }

   
    
}
/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension
extension BlogCell
{
    struct Constant {
        static let Identifier = String(describing: BlogCell.self)
        static let Height:CGFloat = 350.0
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }
    
}
