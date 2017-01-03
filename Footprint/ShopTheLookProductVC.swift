//
//  ShopTheLookProductVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 17/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ShopTheLookProductVC: STLSuperVC
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var imgProduct: UIImageView!
    @IBOutlet fileprivate weak var lblProductTitle: UILabel!
    @IBOutlet fileprivate weak var viewBottom: UIView!
    @IBOutlet fileprivate weak var collectionView:UICollectionView!
    @IBOutlet fileprivate weak var widthConstraintOfCollectionView: NSLayoutConstraint!
    
    //MARK:- Private Vars
    fileprivate var dataSource:[String]!
    //MARK:- Public Vars
    var product:ShopTheLookProduct!{
        didSet{
            dataSource = product.subProductImageURLs
        }
    }
    
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pageAppearance()
        initialSetting()
    }
    
    
    //MARK:- Private Methods
    fileprivate func pageAppearance(){
    }
    
    fileprivate func  initialSetting(){
        pageTitle = Config.AppName.uppercased()
        lblProductTitle.text = product.productName + " By \(Config.AppName)"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        (collectionView.collectionViewLayout as! ShopTheLookProductLayout).totalRows = dataSource.count
        STLProductCell.registerNib(collectionView: collectionView)
        widthConstraintOfCollectionView.constant = (collectionView.frame.height/(CGFloat(dataSource.count))-ShopTheLookProductLayout.gap)
        
        imgProduct.image = UIImage(named: product.productImageURL)
    }


    
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension ShopTheLookProductVC
{
    struct Storyboard{
        static let ControllerID = String(describing: ShopTheLookProductVC.self)
        static let SegueID = "ShopTheLookProductSegue"
    }
    
    //MARK:- Static Method
    static func instantiate() -> ShopTheLookProductVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.ShopTheLook, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! ShopTheLookProductVC
    }
    
}

extension ShopTheLookProductVC:UICollectionViewDelegate
{
    
}

extension ShopTheLookProductVC:UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: STLProductCell.Constant.Identifier, for: indexPath) as! STLProductCell
        cell.data = dataSource[indexPath.row]
        return cell
    }
    
}


