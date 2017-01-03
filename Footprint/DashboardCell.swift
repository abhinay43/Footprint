//
//  DashboardCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 08/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class DashboardCell: UICollectionViewCell
{
    //MARK:- IBOutlets
    @IBOutlet fileprivate weak var lblTitle:UILabel!
    @IBOutlet fileprivate weak var imgBackGround:UIImageView!
    @IBOutlet weak var lblLeftSeperator: UILabel!
    
    @IBOutlet fileprivate weak var widthConstraintRightSeperator: NSLayoutConstraint!
    @IBOutlet fileprivate weak var viewOverlay:UIView!
    
    //MARK:- View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        widthConstraintRightSeperator.constant = lblLeftSeperator.bounds.size.width
    }
    
  
    
    //MARK:- Public Apis
    var record:Dashboard?{
        didSet{
            lblTitle.text = record?.title
            lblTitle.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 21)!
            
            if let bgImageName = record?.imageName{
                let image = UIImage(named: bgImageName)
                imgBackGround.image = image
            }
            
            if record?.title == "PLUS"{
                viewOverlay.alpha = 1
                viewOverlay.backgroundColor = FootprintConstant.Color.FootprintBlueColor
            }
           widthConstraintRightSeperator.constant = lblLeftSeperator.bounds.size.width
           layoutIfNeeded()
            setNeedsUpdateConstraints()
        }
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes)
    {
        super.apply(layoutAttributes)
        
        let featuredHeight: CGFloat = Constant.featuredHeight
        let standardHeight: CGFloat = Constant.standardHegiht
        let delta = 1 - (featuredHeight - frame.height) / (featuredHeight - standardHeight)
        let minAlpha: CGFloat = Constant.minAlpha
        let maxAlpha: CGFloat = Constant.maxAlpha
        let alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        viewOverlay.alpha = alpha
        
        if let record = record{
            if record.title == "PLUS"{
                viewOverlay.alpha = 1
                viewOverlay.backgroundColor = FootprintConstant.Color.FootprintBlueColor
            }
        }
        
//        let scale = max(delta, 0.5)
//        lblTitle.transform = CGAffineTransform(scaleX: scale, y: scale)
        
        // descriptionLabel.alpha = delta
    }
    
}

//MARK:- Extension
extension DashboardCell
{
    struct Storyboard {
        static let Identifier = String(describing:DashboardCell.self)
    }
    
    struct Constant {
        static let featuredHeight: CGFloat = 280
        static let standardHegiht: CGFloat = 100
        
        static let minAlpha: CGFloat = 0.0
        static let maxAlpha: CGFloat = 0.25
    }
    
    static func registerNib(collectionView:UICollectionView)
    {
        collectionView.register(UINib(nibName: Storyboard.Identifier, bundle: nil), forCellWithReuseIdentifier: Storyboard.Identifier)
    }
}

