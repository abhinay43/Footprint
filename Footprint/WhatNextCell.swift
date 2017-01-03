//
//  WhatNextCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 13/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class WhatNextCell: UITableViewCell {

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
extension WhatNextCell{
    struct Storyboard{
        static let Identifier = "WhatNextCell"
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Storyboard.Identifier, bundle: nil), forCellReuseIdentifier: Storyboard.Identifier)
    }
}
