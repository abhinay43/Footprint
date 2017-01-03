//
//  ProductInfoCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 18/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ProductInfoCell: UITableViewCell
{

    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var lblTitle:UILabel!
    
    //MARK:- Public Var
    var data:String!{
        didSet{
            lblTitle.text = data.uppercased()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = WhiteColor
        lblTitle.textColor = UIColor.darkGray
        lblTitle.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 15.0)
    }

}
/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension
extension ProductInfoCell
{
    struct Constant {
        static let Identifier = String(describing: ProductInfoCell.self)
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }
    
}
