//
//  MyOrderCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 15/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class MyOrderCell: UITableViewCell
{
    //MARK:- IBOutlet
    //@IBOutlet fileprivate weak var
    
    @IBOutlet fileprivate weak var lblOrderStatus: UILabel!
    @IBOutlet fileprivate weak var lblOrderTotal: UILabel!
    @IBOutlet fileprivate weak var lblOrderDate: UILabel!
    
    //MARK:-
    var data:MyOrder!{
        didSet{
            lblOrderDate.text = "Order Date: \(data.date!.mediumString())".uppercased()
            lblOrderTotal.text = "Order Total: \(data.total!)".uppercased()
            lblOrderStatus.text = "Order Status: \(data.status!)".uppercased()
        }
    }
    
    override func awakeFromNib() {
        self.backgroundColor = ClearColor
    }
    
}

/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension
extension MyOrderCell
{
    struct Constant {
        static let Identifier = String(describing: MyOrderCell.self)
        static let Height:CGFloat = 110.0
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }
    
}

