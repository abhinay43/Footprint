//
//  NewsLetterCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 13/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class NewsLetterCell: UITableViewCell {

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
extension NewsLetterCell{
    struct Storyboard{
        static let Identifier = "NewsLetterCell"
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Storyboard.Identifier, bundle: nil), forCellReuseIdentifier: Storyboard.Identifier)
    }
}
