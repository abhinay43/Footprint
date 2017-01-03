//
//  ProductSuperVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 11/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ProductSuperVC: HeaderVC
{
    //MARK:- Private methods
    fileprivate var btnSearch:UIButton!
    fileprivate var btnBasket:UIButton!
    
    //MARK:- Public Var
   
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        superInitialSetting()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        btnSearch.frame = CGRect(x: viewHeader.frame.size.width - 35, y: 7, width: 30, height: 30)
        btnBasket.frame = CGRect(x: viewHeader.frame.size.width - 65, y: 7, width: 30, height: 30)
    }
    
    
    //MARK:- Private Methods
    
    fileprivate func  superInitialSetting(){
        addHeaderBarTools()
        
    }
    
    fileprivate func addHeaderBarTools ()
    {
        btnSearch = UIButton(type: .custom)
        btnSearch.addTarget(self, action: #selector(ProductSuperVC.searchAction), for: .touchUpInside)
        btnSearch.frame = CGRect(x: viewHeader.frame.size.width - 35, y: 7, width: 30, height: 30)
        btnSearch.setTitleColor(FootprintConstant.Color.FootprintBlueColor, for: .normal)
        btnSearch.setTitle(FootprintConstant.Font.BlackTie.Text.Search, for: .normal)
        btnSearch.titleLabel?.font = UIFont(name: FootprintConstant.Font.BlackTie.Regular, size: 17)
        viewHeader.addSubview(btnSearch)
        
        
        btnBasket = UIButton(type: .custom)
        btnBasket.addTarget(self, action: #selector(ProductSuperVC.cartAction), for: .touchUpInside)
        btnBasket.frame = CGRect(x: viewHeader.frame.size.width - 65, y: 7, width: 30, height: 30)
        btnBasket.setTitleColor(FootprintConstant.Color.FootprintBlueColor, for: .normal)
        btnBasket.setTitle(FootprintConstant.Font.BlackTie.Text.ShoppingCart, for: .normal)
        btnBasket.titleLabel?.font = UIFont(name: FootprintConstant.Font.BlackTie.Regular, size: 17)
        viewHeader.addSubview(btnBasket)

    }
    
    //MARK:-
    @objc fileprivate func searchAction() {
    
    }
    
    @objc fileprivate func cartAction() {
        
    }

}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension ProductSuperVC
{
    struct Constant {
        static let GrayColor = UIColor(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
    }

}
