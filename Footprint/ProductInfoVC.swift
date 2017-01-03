//
//  ProductInfoVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 18/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

protocol ProductInfoDelegate
{
    func selected(info:ProductInfo)
}

class ProductInfoVC: UIViewController
{

    //MARK:- IBOutlets
    @IBOutlet fileprivate weak var tableView:UITableView!
    
    //MARK:- Public Var
    var delegate:ProductInfoDelegate?
    
    //MARK:- Private Var
    fileprivate let dataSource = ProducPageHelper.productInfoTitles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageAppearance()
        initialSetting()
    }
    
    
    //MARK:- Private Methods
    fileprivate func pageAppearance(){
        tableView.backgroundColor = WhiteColor
    }
    
    fileprivate func  initialSetting()
    {
        tableView.delegate = self
        tableView.dataSource = self
        ProductInfoCell.registerNib(tableView: tableView)
    }
    
    

   

}
/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension ProductInfoVC
{
    struct Storyboard{
        static let ControllerID = String(describing: ProductInfoVC.self)
        static let SegueID = "ProductInfoSegue"
        static let Height:CGFloat = 176.0
    }
    
    //MARK:- Static Metod
    static func instantiate() -> ProductInfoVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Product, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! ProductInfoVC
    }
    
}

extension ProductInfoVC:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier:ProductInfoCell.Constant.Identifier) as!  ProductInfoCell
        cell.data = dataSource[indexPath.row]
        return cell
    }
}

extension ProductInfoVC:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        delegate?.selected(info: ProductInfo(rawValue: indexPath.row)!)
    }
}
