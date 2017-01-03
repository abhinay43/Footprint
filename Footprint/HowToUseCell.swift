//
//  HowToUseCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 13/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class HowToUseCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK:- Extension
extension HowToUseCell{
    struct Storyboard{
        static let Identifier = "HowToUseCell"
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Storyboard.Identifier, bundle: nil), forCellReuseIdentifier: Storyboard.Identifier)
    }
}
