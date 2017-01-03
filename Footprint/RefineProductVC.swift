//
//  RefineProductVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 11/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit
import TTRangeSlider

class RefineProductVC: HeaderVC
{
    //MARK:- Private vars
    fileprivate var refineTypes = RefinePageHelper.refineTypes
    fileprivate var refineInCategory = RefinePageHelper.refineInCategory
    
    //RefineTypes
    fileprivate var refineColors = RefinePageHelper.refineColors
    fileprivate var refineSizes = RefinePageHelper.refineSizes
    fileprivate var refineStyles = RefinePageHelper.refineStyles
    fileprivate var refineMaterial = RefinePageHelper.refineMaterial
    fileprivate var refineSole = RefinePageHelper.refineSole
    fileprivate var dataSourceRefineType = [Any]()
    
    fileprivate var currentRefineType:RefineTypes = .None
    fileprivate var selectedStyle:String?
    fileprivate var selectedColor:String?
    fileprivate var selectedMaterial:String?
    fileprivate var selectedSole:String?
    fileprivate var selectedSize:String?
    
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var refineTypesCollectionView:UICollectionView!
    @IBOutlet fileprivate weak var refineSubTypesCollectionView:UICollectionView!
    @IBOutlet fileprivate weak var refineInCategoryCollectionView:UICollectionView!
    
    @IBOutlet fileprivate weak var rangeSlider: TTRangeSlider!
    @IBOutlet fileprivate weak var lblInThisPR: UILabel!
    @IBOutlet fileprivate weak var btnApply: UIButton!
    @IBOutlet fileprivate weak var btnReset: UIButton!
    
    @IBOutlet fileprivate weak var heightConstraintForRefineSubTypesCV: NSLayoutConstraint!
    @IBOutlet fileprivate weak var heightConstraintForRefineTypes: NSLayoutConstraint!
    
    //MARK:- ViewC life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pageAppearance()
        initialSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: SideMenuVC.NotificationCancelsTouchesInView), object: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
         NotificationCenter.default.post(name: NSNotification.Name(rawValue: SideMenuVC.NotificationCancelsTouchesInView), object: true)
    }

    
    
    //MARK:- Private Methods
    fileprivate func pageAppearance()
    {
        refineTypesCollectionView.backgroundColor = ClearColor
        refineSubTypesCollectionView.backgroundColor = ClearColor
        refineInCategoryCollectionView.backgroundColor = ClearColor
        
        lblInThisPR.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 15)!
        
        btnReset.titleLabel?.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 15)!
        btnApply.backgroundColor = FootprintConstant.Color.FootprintGreenColor
        btnApply.titleLabel?.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 17)!
        btnApply.drawBorder(cornerRadius: 5.0, borderWidth: 0.0, borderColor: ClearColor, maskToBound: true)
    }
    
    fileprivate func  initialSetting()
    {
        pageTitle = "Refine".uppercased()
        
        refineTypesCollectionView.delegate = self
        refineTypesCollectionView.dataSource = self
        RefineTypesCell.registerNib(collectionView: refineTypesCollectionView)
        
        let layout = RefineSubTypesLayout()
        layout.totalRows = refineColors.count
        refineSubTypesCollectionView.delegate = self
        refineSubTypesCollectionView.dataSource = self
        refineSubTypesCollectionView.setCollectionViewLayout(layout, animated: false)
        RefineSubTypesCell.registerNib(collectionView: refineSubTypesCollectionView)
        
        
        refineInCategoryCollectionView.delegate = self
        refineInCategoryCollectionView.dataSource = self
        RefineInCategoryCell.registerNib(collectionView: refineInCategoryCollectionView)
        
        
        rangeSlider.minValue = Constant.MinPriceRange
        rangeSlider.maxValue = Constant.MaxPriceRange
        rangeSlider.handleColor = WhiteColor
        rangeSlider.handleDiameter = 30
        rangeSlider.selectedHandleDiameterMultiplier = 1.3
        rangeSlider.tintColorBetweenHandles = FootprintConstant.Color.FootprintGreenColor
    
        let customFormatter = NumberFormatter()
        customFormatter.positivePrefix = "PRK."
        rangeSlider.numberFormatterOverride = customFormatter

        
    }
    
    fileprivate func setItemFor(cell:RefineSubTypesCell, indexPath:IndexPath)
    {
        switch currentRefineType
        {
            case .Color:
                cell.title = (dataSourceRefineType[indexPath.row] as! RefineColorType).title
                break
            case .Size:
                cell.title = (dataSourceRefineType[indexPath.row] as! RefineSizeType).title
                break
            case .Material:
                cell.title = (dataSourceRefineType[indexPath.row] as! RefineMaterialType).title
                break
            case .Sole:
                cell.title = (dataSourceRefineType[indexPath.row] as! RefineSoleType).title
                break
            case .Style:
                cell.title = (dataSourceRefineType[indexPath.row] as! RefineStyleType).title
                break
            default:
                break
            
        }

    }
    
    
    fileprivate func selectedItemFor(cell:RefineSubTypesCell, indexPath:IndexPath)
    {
        let refineTypeCell = refineTypesCollectionView.cellForItem(at: IndexPath(item: currentRefineType.rawValue, section: 0)) as! RefineTypesCell
        
        switch currentRefineType
        {
            case .Color:
                selectedColor = (dataSourceRefineType[indexPath.row] as! RefineColorType).title
                refineTypes[currentRefineType.rawValue].selectedTitle = selectedColor
                refineTypeCell.changeImageToTitle = (dataSourceRefineType[indexPath.row] as! RefineColorType).title
                break
            case .Size:
                selectedSize = (dataSourceRefineType[indexPath.row] as! RefineSizeType).title
                refineTypes[currentRefineType.rawValue].selectedTitle = selectedSize
                refineTypeCell.changeImageToTitle = (dataSourceRefineType[indexPath.row] as! RefineSizeType).title
                break
            case .Material:
                selectedMaterial = (dataSourceRefineType[indexPath.row] as! RefineMaterialType).title
                refineTypes[currentRefineType.rawValue].selectedTitle = selectedMaterial
                refineTypeCell.changeImageToTitle = (dataSourceRefineType[indexPath.row] as! RefineMaterialType).title
                break
            case .Sole:
                selectedSole = (dataSourceRefineType[indexPath.row] as! RefineSoleType).title
                refineTypes[currentRefineType.rawValue].selectedTitle = selectedSole
                refineTypeCell.changeImageToTitle = (dataSourceRefineType[indexPath.row] as! RefineSoleType).title
                break
            case .Style:
                selectedStyle = (dataSourceRefineType[indexPath.row] as! RefineStyleType).title
                refineTypes[currentRefineType.rawValue].selectedTitle = selectedStyle
                refineTypeCell.changeImageToTitle = (dataSourceRefineType[indexPath.row] as! RefineStyleType).title
                break
            default:
                break
            
        }
        
        heightConstraintForRefineSubTypesCV.constant = 0
        refineSubTypesCollectionView.isHidden = true
        
    }

    fileprivate func reset()
    {
        selectedStyle    = nil
        selectedSole     = nil
        selectedMaterial = nil
        selectedSize     = nil
        selectedColor    = nil
        currentRefineType = .None
        
        refineTypes = RefinePageHelper.refineTypes
        rangeSlider.selectedMinimum = Constant.MinPriceRange
        rangeSlider.selectedMaximum = Constant.MaxPriceRange
        
        dataSourceRefineType.removeAll()
        refineTypesCollectionView.reloadData()
        refineSubTypesCollectionView.reloadData()
        refineInCategoryCollectionView.reloadData()
    }
    
    @IBAction func resetAction(){
        reset()
    }
    

}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension RefineProductVC
{
    struct Storyboard{
        static let ControllerID = String(describing: RefineProductVC.self)
        static let SegueID = "RefineProductSegue"
    }
    
    
    struct Constant {
        static let MinPriceRange:Float = 0.0
        static let MaxPriceRange:Float = 10000.0
    }
    
    //MARK:- Static Metod
    static func instantiate() -> RefineProductVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Product, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! RefineProductVC
    }
    
}


extension RefineProductVC:UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath)
        
        switch collectionView
        {
            case refineTypesCollectionView:
                
                break
            case refineSubTypesCollectionView:
                selectedItemFor(cell: (cell as! RefineSubTypesCell), indexPath: indexPath)
                break
            case refineInCategoryCollectionView:
                (cell as! RefineInCategoryCell).isSelected = true
                break
            default:
                break
        }
    }
    
}

extension RefineProductVC:UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        switch collectionView
        {
            case refineTypesCollectionView:
                return 1
            case refineSubTypesCollectionView:
                return 1
            case refineInCategoryCollectionView:
                return 2
            default:
                return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        switch collectionView
        {
            case refineTypesCollectionView:
                return refineTypes.count
            case refineSubTypesCollectionView:
                return dataSourceRefineType.count
            case refineInCategoryCollectionView:
                
                switch section
                {
                    case 0:
                        return refineInCategory.count/2
                    case 1:
                        return (refineInCategory.count - refineInCategory.count/2)
                    default:
                        return 1
                }
            default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell:UICollectionViewCell!
        
        switch collectionView
        {
            case refineTypesCollectionView:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: RefineTypesCell.Constant.Identifier, for: indexPath) as! RefineTypesCell
                cell.tag = indexPath.row
                (cell as! RefineTypesCell).data = refineTypes[indexPath.row]
                (cell as! RefineTypesCell).delegate = self
                
                if indexPath.row == currentRefineType.rawValue{
                    (cell as! RefineTypesCell).isItemSelected = true
                }
                
                
            break
            case refineSubTypesCollectionView:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: RefineSubTypesCell.Constant.Identifier, for: indexPath) as! RefineSubTypesCell
                setItemFor(cell: (cell as! RefineSubTypesCell), indexPath: indexPath)
            break
            
            case refineInCategoryCollectionView:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: RefineInCategoryCell.Constant.Identifier, for: indexPath) as! RefineInCategoryCell
                
                if indexPath.section == 0{
                    (cell as! RefineInCategoryCell).title = refineInCategory[indexPath.row].title
                }else{
                    let index = refineInCategory.count/2 + indexPath.row
                    (cell as! RefineInCategoryCell).title = refineInCategory[index].title
                }
                
                
            break
            
            default:
                cell = UICollectionViewCell()
                break
        }
        
        return cell
        
    }
    
    
}


extension RefineProductVC:RefineTypesDelegate
{
    func refineAction(index:Int)
    {
        currentRefineType = RefineTypes(rawValue: index)!
        
        switch currentRefineType
        {
            case .Color:
                dataSourceRefineType = refineColors
                break
            case .Size:
                dataSourceRefineType = refineSizes
                break
            case .Material:
                dataSourceRefineType = refineMaterial
                break
            case .Sole:
                dataSourceRefineType = refineSole
                break
            case .Style:
                dataSourceRefineType = refineStyles
                break
            default:
                currentRefineType = .None
                dataSourceRefineType.removeAll()
                break
        
        }
        
        heightConstraintForRefineSubTypesCV.constant = heightConstraintForRefineTypes.constant
        refineSubTypesCollectionView.isHidden = false
        refineTypesCollectionView.reloadData()
        refineSubTypesCollectionView.reloadData()
       
    }
}

extension RefineProductVC:UIGestureRecognizerDelegate
{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}



