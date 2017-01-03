//
//  ProductColorVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 18/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

protocol ProductColorDelegate {
    func selected(colorInfo:ProductColorInfo)
}

class ProductColorVC: UIViewController
{
    //MARK:- IBOutlets
    @IBOutlet fileprivate weak var collectionView:UICollectionView!
    
    //MARK:- Public Var
    var delegate:ProductColorDelegate?
    
    //MARK:- Private Var
    fileprivate let dataSource = ProducPageHelper.productColors
    
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
        ProductColorCell.registerNib(collectionView: collectionView)
    }
}
/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension ProductColorVC
{
    struct Storyboard{
        static let ControllerID = String(describing: ProductColorVC.self)
        static let SegueID = "ProductColorSegue"
        static let Height:CGFloat = 176.0
    }
    
    //MARK:- Static Metod
    static func instantiate() -> ProductColorVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Product, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! ProductColorVC
    }
    
}


extension ProductColorVC:UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        delegate?.selected(colorInfo: dataSource[indexPath.row])
    }
}

extension ProductColorVC:UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductColorCell.Constant.Identifier, for: indexPath) as! ProductColorCell
        cell.data = dataSource[indexPath.row]
        return cell
    }
    
}


