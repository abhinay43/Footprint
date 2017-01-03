//
//  ProductVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 09/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ProductVC: ProductSuperVC
{
    
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    @IBOutlet fileprivate weak var btnColoums: UIButton!
    @IBOutlet fileprivate weak var btnFilter: UIButton!
    
    //MARK:- Private Vars
    fileprivate var dataSource = ProducPageHelper.dataSource
    fileprivate var isTwoColumnLayoutUsed = true

    //MARK:- ViewC life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pageAppearance()
        initialSetting()
    }
    
    
    //MARK:- Private Methods
    fileprivate func pageAppearance(){
        btnFilter.setTitleColor(FootprintConstant.Color.FootprintBlueColor, for: .normal)
        btnColoums.setTitleColor(FootprintConstant.Color.FootprintBlueColor, for: .normal)
    }
    
    fileprivate func  initialSetting()
    {
        pageTitle = "Formal".uppercased()
        isHideBackgroundImage = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        ProductCell.registerNib(collectionView: collectionView)
    }
    
    //MARK:- IBAction
    @IBAction fileprivate func changeGridColumn()
    {
        let layout = collectionView.collectionViewLayout as! ProductCollectionViewLayout
        
        if isTwoColumnLayoutUsed{
            isTwoColumnLayoutUsed = false
            layout.totalRows = 3
            btnColoums.setTitle(FootprintConstant.Font.BlackTie.Text.SixSquare, for: .normal)
            
        }else{
            isTwoColumnLayoutUsed = true
            layout.totalRows = 2
            btnColoums.setTitle(FootprintConstant.Font.BlackTie.Text.FourSquare, for: .normal)
        }
        UIView.animate(withDuration: 0.5, animations: {[weak self] in
            self?.collectionView.collectionViewLayout.invalidateLayout()
            self?.collectionView.setCollectionViewLayout(layout, animated: true)
        })
        
    }
    
    @IBAction func handlePinchGuesture(_ sender: UIPinchGestureRecognizer) {
        
        if sender.scale < 1 && isTwoColumnLayoutUsed{
            changeGridColumn()
        }else if sender.scale > 1 && !isTwoColumnLayoutUsed{
            changeGridColumn()
        }
        sender.scale = 1.0
    }
    
    //MARK:- Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == RefineProductVC.Storyboard.SegueID{
            
        }else if segue.identifier == ProductDetailVC.Storyboard.SegueID{
            let vc = segue.destination as! ProductDetailVC
            let product = dataSource[(sender as! IndexPath).row]
            vc.product = product
        }
    }
    
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension ProductVC
{
    struct Storyboard{
        static let ControllerID = String(describing: ProductVC.self)
    }
    
    //MARK:- Static Metod
    static func instantiate() -> ProductVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Product, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! ProductVC
    }
    
}

extension ProductVC:UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        self.performSegue(withIdentifier: ProductDetailVC.Storyboard.SegueID, sender: indexPath)
    }
}

extension ProductVC:UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.Constant.Identifier, for: indexPath) as! ProductCell
        cell.product = dataSource[indexPath.row]
        return cell
    }

}
