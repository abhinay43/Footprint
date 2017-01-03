//
//  ShopTheLookVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 15/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ShopTheLookVC: SuperContainerVC
{

    //MARK:- Private Vars
    fileprivate let dataSource = ShopTheLook.dataSource
    fileprivate let dataSource2 = ShopTheLook.dataSource2

    
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var leftTableView:EndlessTableView!
    @IBOutlet fileprivate weak var rightTableView:EndlessTableView!
    
    //MARK:- View LifeCycle
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
        leftTableView.dataSource = self
        rightTableView.dataSource = self
        
        leftTableView.delegate = self
        rightTableView.delegate = self
        
        ShopTheLookCell.registerNib(tableView: leftTableView)
        ShopTheLookCell.registerNib(tableView: rightTableView)
        
        
        leftTableView.attached = rightTableView
        leftTableView.enableAutoScrolling = false
        leftTableView.differenceRateValue = 1.3
        
        leftTableView.enableEndlessScrolling = false
        rightTableView.enableEndlessScrolling = false
    }


    //MARK:-
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ShopTheLookProductVC
        vc.product = sender as! ShopTheLookProduct
    }
    

}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension ShopTheLookVC
{
    struct Storyboard{
        static let ControllerID = String(describing: ShopTheLookVC.self)
    }
    
    //MARK:- Static Method
    static func instantiate() -> ShopTheLookVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.ShopTheLook, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! ShopTheLookVC
    }
    
}

extension ShopTheLookVC:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch tableView {
            case leftTableView:
                return dataSource.count
            case rightTableView:
                return dataSource2.count
            default:
                return dataSource.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopTheLookCell.Constant.Identifier) as!  ShopTheLookCell
        
        switch tableView
        {
            case leftTableView:
                cell.imageURL = dataSource[indexPath.row].productImageURL
                break
            case rightTableView:
                cell.imageURL = dataSource2[indexPath.row].productImageURL
                break
            default:
                break
        }

        return cell
        
    }
}

extension ShopTheLookVC:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch tableView
        {
            case leftTableView:
                let imageURL = dataSource[indexPath.row].productImageURL
                return ShopTheLookCell.getCellHeight(imageURL: imageURL!)
            case rightTableView:
                let imageURL = dataSource2[indexPath.row].productImageURL
                return ShopTheLookCell.getCellHeight(imageURL: imageURL!)
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let product:ShopTheLookProduct?
        switch tableView
        {
            case leftTableView:
                product = dataSource[indexPath.row]
            break
            case rightTableView:
                product = dataSource2[indexPath.row]
            break
            default:
                product = nil
                break
        }
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: ShopTheLookProductVC.Storyboard.SegueID, sender: product)
    }
}

