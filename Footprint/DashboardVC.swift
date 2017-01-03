//
//  DashboardVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 08/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit
import SFFocusViewLayout

class DashboardVC: SuperContainerVC
{

    //MARK:- IBoutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //MARK:- Private Vars
    fileprivate var dataSource = DashboardHelper.dataSource
    fileprivate var category:DashboardCategory = .Shoes
    
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
        isHideBackgroundImage = true
        self.view.backgroundColor = FootprintConstant.Color.FootprintBlueColor
        collectionView.backgroundColor = ClearColor
    }
    
    fileprivate func initialSetting ()
    {
        //Collection View Setting
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        
        //collectionView.backgroundColor = UIColor.lightGrayColor()
        DashboardCell.registerNib(collectionView: collectionView)
        
    }
    
    //MARK:-
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension DashboardVC
{
    struct Storyboard{
        static let ControllerID = String(describing: DashboardVC.self)
    }
    
    //MARK:- Static Metod
    static func instantiate() -> DashboardVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Main, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! DashboardVC
    }
    
}

//MARK:- Extension UICollectionViewDataSource
extension DashboardVC: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return DashboardHelper.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardCell.Storyboard.Identifier, for: indexPath as IndexPath) as! DashboardCell
        
        return cell
    }
    
     @objc(collectionView:willDisplayCell:forItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
     {
        guard let cell = cell as? DashboardCell else{
            fatalError("error with registred cell")
        }
        cell.record = dataSource[indexPath.row]
    }
    
}
//MARK:- Extension UICollectionViewDelegate

extension DashboardVC: UICollectionViewDelegate
{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        guard let focusViewLayout = collectionView.collectionViewLayout as? SFFocusViewLayout else {
            fatalError("error casting focus layout from collection view")
        }
        
        if indexPath.row > 3
        {
            category = DashboardCategory(rawValue: indexPath.row)!
            switch category
            {
                case .Blog:
                    let vc = BlogVC.instantiate()
                    let _ = self.navigationController?.pushViewController(vc, animated: true)
                    break
                case .Plus:
                    let vc = PlusVC.instantiate()
                    let _ = self.navigationController?.pushViewController(vc, animated: true)
                    break
                default:
                    break
            }
            return
        }
        
        let offset = focusViewLayout.dragOffset * CGFloat(indexPath.item)
        category = DashboardCategory(rawValue: indexPath.row)!
        
        if collectionView.contentOffset.y != offset{
            collectionView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
        }
        else{
            switch category
            {
                case .Shoes:
                        let vc = ShoeBrandsVC.instantiate()
                        let _ = self.navigationController?.pushViewController(vc, animated: true)
                    break
                case .Brand:
                        let vc = BrandVC.instantiate()
                        let _ = self.navigationController?.pushViewController(vc, animated: true)
                    break
                case .ShopTheLook:
                        let vc = ShopTheLookVC.instantiate()
                        let _ = self.navigationController?.pushViewController(vc, animated: true)
                    break
                case .Bespoke:
                        let vc = BespokeVC.instantiate()
                        let _ = self.navigationController?.pushViewController(vc, animated: true)
                    break
                default:
                    break
            }
            
           
        }
        
       // self.performSelector(#selector(HomeVC.openSelectedCategoryPage(_:)), withObject: indexPath, afterDelay: 0.25)
        
    }
    
}
