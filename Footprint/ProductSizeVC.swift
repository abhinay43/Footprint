//
//  ProductSizeVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 19/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

protocol ProductSizeDelegate {
    func selected(size:String)
}

class ProductSizeVC: UIViewController
{
    //MARK:- IBOutlets
    @IBOutlet fileprivate weak var collectionView:UICollectionView!
    
    //MARK:- Public Var
    var delegate:ProductSizeDelegate?
    
    //MARK:- Private Var
    fileprivate let dataSource = ProducPageHelper.productSizes
    
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
        collectionView.dataSource = self
        collectionView.delegate = self
        ProductSizeCell.registerNib(collectionView: collectionView)
    }
}
/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension ProductSizeVC
{
    struct Storyboard{
        static let ControllerID = String(describing: ProductSizeVC.self)
        static let SegueID = "ProductSizeSegue"
        static let Height:CGFloat = 176.0
    }
    
    //MARK:- Static Metod
    static func instantiate() -> ProductSizeVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Product, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! ProductSizeVC
    }
    
}


extension ProductSizeVC:UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        delegate?.selected(size: dataSource[indexPath.row])
    }
}

extension ProductSizeVC:UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductSizeCell.Constant.Identifier, for: indexPath) as! ProductSizeCell
        cell.data = dataSource[indexPath.row]
        return cell
    }
    
}


