//
//  PlusVCViewController.swift
//  Footprint
//
//  Created by Abhinay Maurya on 22/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class PlusVC: HeaderVC
{
    
    enum Cell:Int {
        case FAQ, HowToUse, NewsLetter, WhatNext, Contact
        
        static func cellType(value:Int) -> Cell {
            return Cell(rawValue: value)!
        }
    }

    //MARK:- Private Vars
    fileprivate var selectedIndex = -1
    fileprivate let dataSource = PlusHelper.dataSource
    
    //MARK:- IBOutlets
    @IBOutlet fileprivate weak var tableView:UITableView!
    
    
    //MARK:- View Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.pageAppearance()
        self.initialSetting()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Private Methods
    fileprivate func initialSetting ()
    {
        pageTitle = "PLUS"
        tableView.delegate = self
        tableView.dataSource = self
        
        //Register the nibs
        FaqsCell.registerNib(tableView: tableView)
        HowToUseCell.registerNib(tableView: tableView)
        NewsLetterCell.registerNib(tableView: tableView)
        WhatNextCell.registerNib(tableView: tableView)
        ContactCell.registerNib(tableView: tableView)
        
    }
    
    fileprivate func pageAppearance ()
    {
        tableView.backgroundColor = ClearColor
        isHideBackgroundImage = true
        headerBGColor = ClearColor
        tintColor = WhiteColor
        view.backgroundColor = FootprintConstant.Color.FootprintBlueColor
        
    }
    
    //MARK:-
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }



}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension PlusVC
{
    struct Storyboard{
        static let ControllerID = String(describing: PlusVC.self)
    }
    
    //MARK:- Static Metod
    static func instantiate() -> PlusVC{
        let controller = PlusVC(nibName: "PlusVC", bundle: nil)
        return controller
    }
    
}

extension PlusVC:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch section
        {
            case selectedIndex:
                return 1
            default:
                return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellType = Cell.cellType(value: indexPath.row)
        let cell:UITableViewCell!
        
        switch cellType
        {
            case .FAQ:
                cell = tableView.dequeueReusableCell(withIdentifier: FaqsCell.Constant.Identifier, for: indexPath) as! FaqsCell
                //return cell
            case .HowToUse:
                cell = tableView.dequeueReusableCell(withIdentifier: FaqsCell.Constant.Identifier, for: indexPath) as! FaqsCell
                break
            case .NewsLetter:
                cell = tableView.dequeueReusableCell(withIdentifier: FaqsCell.Constant.Identifier, for: indexPath) as! FaqsCell
                break
            case .WhatNext:
                cell = tableView.dequeueReusableCell(withIdentifier: FaqsCell.Constant.Identifier, for: indexPath) as! FaqsCell
                break
            case .Contact:
                cell = tableView.dequeueReusableCell(withIdentifier: FaqsCell.Constant.Identifier, for: indexPath) as! FaqsCell
                break
        }
        
        
        return cell
        
        
    }
    
    
    @objc(tableView:heightForRowAtIndexPath:) func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let cellType = Cell.cellType(value: indexPath.section)
        
        switch cellType
        {
            case .FAQ:
                return FaqsCell.getCellHeight(data: dataSource[indexPath.section])
            case .HowToUse:
                return FaqsCell.getCellHeight(data: dataSource[indexPath.section])
            case .NewsLetter:
                return FaqsCell.getCellHeight(data: dataSource[indexPath.section])
            case .WhatNext:
                return FaqsCell.getCellHeight(data: dataSource[indexPath.section])
            case .Contact:
                return FaqsCell.getCellHeight(data: dataSource[indexPath.section])
            
        }
    }

}

extension PlusVC:UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        cell.tag = indexPath.section
        let cellType = Cell.cellType(value: indexPath.section)
        
        switch cellType
        {
            case .FAQ:
                (cell as! FaqsCell).data =  dataSource[indexPath.row]
                (cell as! FaqsCell).delegate = self
                break
            case .HowToUse:
                (cell as! FaqsCell).data =  dataSource[indexPath.row]
                (cell as! FaqsCell).delegate = self
                break
            case .NewsLetter:
                (cell as! FaqsCell).data =  dataSource[indexPath.row]
                (cell as! FaqsCell).delegate = self
                break
            case .WhatNext:
                (cell as! FaqsCell).data =  dataSource[indexPath.row]
                (cell as! FaqsCell).delegate = self
                break
            case .Contact:
                (cell as! FaqsCell).data =  dataSource[indexPath.row]
                (cell as! FaqsCell).delegate = self
                break
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = PlusHeaderView.instantiate()
        headerView.delegate = self
        headerView.tag = section
        headerView.title = dataSource[section].headerTitle
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return PlusHeaderView.Constant.Height
    }
}


extension PlusVC:PlusHeaderViewDelegate
{
    func headerTappedForSection(section:Int)
    {
        let indexPath:IndexPath!
        tableView.beginUpdates()
        
        if selectedIndex != -1
        {
            indexPath = IndexPath(row: 0, section: selectedIndex)
            tableView.deleteRows(at: [indexPath], with: .fade)
            selectedIndex = -1
        }else{
            selectedIndex = section
            indexPath = IndexPath(row: 0, section: selectedIndex)
            tableView.insertRows(at: [indexPath], with: .fade)
        }
        
        tableView.endUpdates()
        
    }
}

extension PlusVC:FaqsCellDelegate
{
    func closeSection(section: Int){
        headerTappedForSection(section:section)
    }
}
