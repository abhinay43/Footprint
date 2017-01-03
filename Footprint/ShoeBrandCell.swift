//
//  ShoeBrandCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 27/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

protocol ShoeBrandCellDelegate {
    func cellTapped (index:Int)
}

class ShoeBrandCell: UITableViewCell
{

    ///MARK:- IBOutlet
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet fileprivate weak var lblTitle: UILabel!
    @IBOutlet fileprivate weak var sectionImage: UIImageView!
    
    //MARK:- Private vars
    fileprivate var tapGesture = UITapGestureRecognizer()
    
    //MARK:- Public vars
    var delegate:ShoeBrandCellDelegate?
    
    var data:ShoeBrand!{
        didSet{
            backgroundColor = ClearColor
            lblTitle?.text = data.title.uppercased()
            lblTitle?.textColor = WhiteColor
            
            sectionImage.contentMode = .scaleAspectFill
            
            if let image = UIImage(named:data.imageName){
                sectionImage.image = image
            }
            
        }
    }
    
    //MARK:-
    override func awakeFromNib() {
        tapGesture.addTarget(self, action: #selector(ShoeBrandCell.cellTapped))
        tapGesture.numberOfTapsRequired = 1
        sectionImage.addGestureRecognizer(tapGesture)
    }
    
    override func layoutSubviews() {
        heightConstraint.constant = self.frame.size.height
    }
    
    //MARK:- IBAction
    
    @objc fileprivate func cellTapped() {
        
        if let delegate = delegate{
            delegate.cellTapped(index:self.tag)
        }
        
    }

    
}

/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension

extension ShoeBrandCell
{
    struct Constant {
        static let Identifier = "ShoeBrandCell"
        static let DefaultHeight:CGFloat = 100.0
        static let OpenHeight:CGFloat = 280.0
    }
    
    static func registerNib(tableView:UITableView){
        tableView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellReuseIdentifier: Constant.Identifier)
    }
}

