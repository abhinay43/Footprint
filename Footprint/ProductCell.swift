//
//  ProductCell.swift
//  Footprint
//
//  Created by Abhinay Maurya on 09/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCell: UICollectionViewCell
{
    //MARK:- IBOutlets
    @IBOutlet fileprivate weak var imgProduct:          UIImageView!
    @IBOutlet fileprivate weak var viewImageContainer:  UIView!
    @IBOutlet fileprivate weak var lblTitle:            UILabel!
    @IBOutlet fileprivate weak var lblCost:             UILabel!
    @IBOutlet fileprivate weak var imageHeightConstrnt: NSLayoutConstraint!
    @IBOutlet fileprivate weak var imageWidthConstrnt:  NSLayoutConstraint!
    @IBOutlet fileprivate weak var activityIndicator:   UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewImageContainer.backgroundColor = Constant.GrayColor
        lblTitle.textColor = FootprintConstant.Color.FootprintBlueColor
        lblCost.textColor = FootprintConstant.Color.FootprintBlueColor
    }
    
    //MARK:- Public Vars
    var product:Product!{
        didSet{
            lblTitle.text = product.productTitle
            lblCost.text = "PKR\(product.productCost!)"
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        checkImageExistOnTheURL()
        
    }
    
    
    fileprivate func checkImageExistOnTheURL ()
    {
        if let imageUrl = product.imageURL
        {
            self.activityIndicator.startAnimating()
            imgProduct.isHidden = true
            self.addImageInCell(image: UIImage(named: imageUrl))
            self.activityIndicator.stopAnimating()
            
            //                imgProduct.isHidden = true
            //                self.activityIndicator.startAnimating()
            //                let url = URL(string: imageUrl)
            //                imgProduct.kf_setImage(with: url, placeholder: nil, options: [.transition(.fade(1))], progressBlock: nil, completionHandler: { (image, error, cache, url) in
            //
            //                    DispatchQueue.main.async { [weak self] in
            //                        self?.activityIndicator.stopAnimating()
            //                        if let image = self?.imgProduct.image{
            //                            self?.addImageInCell(image: image)
            //                        }
            //
            //                    }
            //                    
            //                })
        }

    }
    

    fileprivate func addImageInCell (image:UIImage?)
    {
        
        guard let image = image else{
            return
        }
        
        
        let imageSize = image.size
        
        var imageNewheight:CGFloat!
        var imageNewWidth:CGFloat!
        
        let viewImageContainerHeight = frame.size.height - Constant.BottomViewHeight
        
        if imageSize.height > imageSize.width{
            imageNewheight = viewImageContainerHeight
            imageNewWidth = (imageSize.width/imageSize.height) * imageNewheight
            
        }else{
            imageNewWidth = self.frame.size.width
            imageNewheight = (imageSize.height/imageSize.width) * imageNewWidth
        }
        
        imageHeightConstrnt.constant = imageNewheight
        imageWidthConstrnt.constant = imageNewWidth
        imageHeightConstrnt.constant = imageNewheight
        imageWidthConstrnt.constant = imageNewWidth
        
        imgProduct.image = image
        imgProduct.isHidden = false
    }
    

    

}

/* ------------------------------ extension -------------------------- */

extension ProductCell
{
    struct Constant
    {
        static let Identifier = "ProductCell"
        static let BottomViewHeight:CGFloat = 50.0
        static let GrayColor = UIColor(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
    }
    
    static func registerNib (collectionView:UICollectionView){
        collectionView.register(UINib(nibName: Constant.Identifier, bundle: nil), forCellWithReuseIdentifier: Constant.Identifier)
    }
}
