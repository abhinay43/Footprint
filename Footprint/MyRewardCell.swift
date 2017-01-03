//
//  MyRewardCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 16/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class MyRewardCell: UITableViewCell
{
    var title:String!{
        didSet{
            self.textLabel?.text = title
        }
    }
    
    var data:String!{
        didSet{
            self.detailTextLabel?.text = data
        }
    }

}
/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension
extension MyRewardCell
{
    struct Constant {
        static let Identifier = String(describing: MyRewardCell.self)
        static let Height:CGFloat = 35.0
    }
    
    
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }
    
}
