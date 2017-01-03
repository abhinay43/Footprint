//
//  ProductShareVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 19/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

protocol ProductShareDelegate {
    func share(media:String)
    func closeMediaView()
}

class ProductShareVC: UIViewController
{
    //MARK:- IBOutlets
    @IBOutlet fileprivate weak var collectionView:UICollectionView!
    @IBOutlet fileprivate weak var constraintHeight: NSLayoutConstraint!
    @IBOutlet fileprivate weak var constraintWidth: NSLayoutConstraint!
    
    //MARK:- Public Var
    var delegate:ProductShareDelegate?
    
    //MARK:- Private Var
    fileprivate let dataSource = ProducPageHelper.sharingMedia
    
    //MARK:- ViewC life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pageAppearance()
        initialSetting()
    }
    
    //MARK:- Private Methods
    fileprivate func pageAppearance(){
    }
    
    fileprivate func  initialSetting()
    {
        constraintHeight.constant = (CGFloat((dataSource.count - 1)) * ProductShareLayout.gap) + (ProductShareCell.Constant.Width * CGFloat(dataSource.count))
        constraintWidth.constant = ProductShareCell.Constant.Width
        
        collectionView.dataSource = self
        collectionView.delegate = self
        ProductShareCell.registerNib(collectionView: collectionView)
    }
    
    //MARK:- IBAction
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        delegate?.closeMediaView()
    }
}
/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension ProductShareVC
{
    struct Storyboard{
        static let ControllerID = String(describing: ProductShareVC.self)
        static let SegueID = "ProductShareSegue"
        static let Width:CGFloat = 50.0
    }
    
    //MARK:- Static Metod
    static func instantiate() -> ProductShareVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Product, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! ProductShareVC
    }
    
}


extension ProductShareVC:UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        delegate?.share(media:dataSource[indexPath.row])
    }
}

extension ProductShareVC:UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductShareCell.Constant.Identifier, for: indexPath) as! ProductShareCell
        cell.media = dataSource[indexPath.row]
        return cell
    }
    
}


