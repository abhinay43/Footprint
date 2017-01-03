//
//  ShoeBrandVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 09/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ShoeBrandVC: SuperContainerVC
{
    
    //MARK:- IBoutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //MARK:- Private Vars
    fileprivate var dataSource = ShoeBrandHelper.dataSource
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageAppearance()
        self.initialSetting()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Private Apis
    
    fileprivate func pageAppearance (){
       // view.backgroundColor = ClearColor
        collectionView.backgroundColor = ClearColor
    }
    
    fileprivate func initialSetting ()
    {
        //Collection View Setting
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        
        //collectionView.backgroundColor = UIColor.lightGrayColor()
        ShoeCategoryCell.registerNib(collectionView: collectionView)
        
    }
    
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension ShoeBrandVC
{
    struct Storyboard{
        static let ControllerID = String(describing: ShoeBrandVC.self)
    }
    
    //MARK:- Static Metod
    static func instantiate() -> ShoeBrandVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Main, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! ShoeBrandVC
    }
    
}

//MARK:- Extension UICollectionViewDataSource
extension ShoeBrandVC: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoeCategoryCell.Storyboard.Identifier, for: indexPath as IndexPath) as! ShoeCategoryCell
        
        return cell
    }
    
    @objc(collectionView:willDisplayCell:forItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? ShoeCategoryCell else {
            fatalError("error with registred cell")
        }
        
        cell.record = dataSource[indexPath.row]
    }
    
}
//MARK:- Extension UICollectionViewDelegate

extension ShoeBrandVC: UICollectionViewDelegate
{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        guard let focusViewLayout = collectionView.collectionViewLayout as? ShoeBrandLayout else {
            fatalError("error casting focus layout from collection view")
        }
        
        let offset = focusViewLayout.dragOffset * CGFloat(indexPath.item)
        
        if collectionView.contentOffset.y != offset{
            collectionView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
            
        }
        
        // self.performSelector(#selector(HomeVC.openSelectedCategoryPage(_:)), withObject: indexPath, afterDelay: 0.25)
        
    }
    
}
