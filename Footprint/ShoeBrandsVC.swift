//
//  ShoeBrandsVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 27/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ShoeBrandsVC: SuperContainerVC
{

    //MARK:- IBoutlet
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    //MARK:- Private Vars
    fileprivate var dataSource = ShoeBrandHelper.dataSource
    fileprivate var selectedIndex:Int = -1
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageAppearance()
        self.initialSetting()
    }
    
    
    //MARK:- Private Apis
    fileprivate func pageAppearance (){
        tableView.backgroundColor = ClearColor
    }
    
    fileprivate func initialSetting (){
        //Table View Setting
        tableView.delegate = self
        tableView.dataSource = self
        ShoeBrandCell.registerNib(tableView: tableView)
    }


}
/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension ShoeBrandsVC
{
    struct Storyboard{
        static let ControllerID = String(describing: ShoeBrandsVC.self)
    }
    
    //MARK:- Static Metod
    static func instantiate() -> ShoeBrandsVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Main, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! ShoeBrandsVC
    }
    
}


//MARK:- Extension DataSource
extension ShoeBrandsVC:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    @objc(tableView:heightForRowAtIndexPath:) func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if selectedIndex == indexPath.row{
            return ShoeBrandCell.Constant.OpenHeight
        }
        return ShoeBrandCell.Constant.DefaultHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoeBrandCell.Constant.Identifier) as! ShoeBrandCell
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
}

//MARK:- Extension Delegate
extension ShoeBrandsVC:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let data = dataSource[indexPath.row]
        (cell as! ShoeBrandCell).data = data
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        if selectedIndex !=  -1
        {
            let cell = tableView.cellForRow(at: IndexPath(row: selectedIndex, section: 0))
            var frame = cell?.frame
            
            
            
            frame?.size.height = ShoeBrandCell.Constant.DefaultHeight
            
            
            UIView.animate(withDuration: 0.33, animations: {[weak self] in
                
                for cell in tableView.visibleCells
                {
                    let cellIndexPath = tableView.indexPath(for: cell)
                    
                    if (cellIndexPath?.row)! >= (self?.selectedIndex)!
                    {
                        
                        var frame = cell.frame
                        let yAxis = ShoeBrandCell.Constant.OpenHeight - ShoeBrandCell.Constant.DefaultHeight - tableView.rowHeight
                        frame.origin.y -= yAxis
                        cell.frame = frame;
                    }
                }
                cell?.frame = frame!
                
                (cell as! ShoeBrandCell).heightConstraint.constant = (frame?.size.height)!
                (cell as! ShoeBrandCell).layoutIfNeeded()
                
                })
            { bool in
                tableView.beginUpdates()
                tableView.endUpdates()
            }

            selectedIndex = -1
            
        }
        else{
            
            let cell = tableView.cellForRow(at: indexPath)
            var frame = cell?.frame
            
            selectedIndex = indexPath.row
            frame?.size.height = ShoeBrandCell.Constant.OpenHeight
            
            
            UIView.animate(withDuration: 0.33, animations: {
                
                for cell in tableView.visibleCells
                {
                    let cellIndexPath = tableView.indexPath(for: cell)
                    
                    if (cellIndexPath?.row)! > indexPath.row
                    {
                        
                        var frame = cell.frame
                        let yAxis = ShoeBrandCell.Constant.OpenHeight - ShoeBrandCell.Constant.DefaultHeight - tableView.rowHeight
                        frame.origin.y += yAxis
                        
                        cell.frame = frame;
                    }
                }
                cell?.frame = frame!
                
                (cell as! ShoeBrandCell).heightConstraint.constant = (frame?.size.height)!
                (cell as! ShoeBrandCell).layoutIfNeeded()
                
                })
            { bool in
                tableView.beginUpdates()
                tableView.endUpdates()
                
                let vc = ProductVC.instantiate()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ShoeBrandsVC:ShoeBrandCellDelegate
{
    func cellTapped (index:Int)
    {
//        if selectedIndex == index{
//            selectedIndex = -1
//        }else{
//            if selectedIndex != -1 {
//                selectedIndex = -1
//            }else{
//                selectedIndex = index
//            }
//        }
//        UIView.animate(withDuration: 0.33) { 
//            self.tableView.beginUpdates()
//            self.tableView.endUpdates()
//            
//        }
        
        
    }
}


