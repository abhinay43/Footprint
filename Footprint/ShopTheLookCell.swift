//
//  ShopTheLookCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 15/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ShopTheLookCell: UITableViewCell
{
    
    var imageURL:String!{
        didSet{
            imgProduct.image = UIImage(named: imageURL)
        }
    }
    
    //MARK:- IBoutlets
    @IBOutlet fileprivate weak var imgProduct:UIImageView!
    
    //MARK:- View Life
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK:- Class Methods
    class func getCellHeight (imageURL:String) -> CGFloat
    {
        let image = UIImage(named: imageURL)
        
        if let image = image{
            let width = UIScreen.main.bounds.size.width / 2.0
            let sizeOfImage = image.size
            let height = (sizeOfImage.height / sizeOfImage.width) * width
            return height
        }
        
        return 0
    }
    
    
    
}

/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension
extension ShopTheLookCell
{
    struct Constant {
        static let Identifier = "ShopTheLookCell"
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }

}
