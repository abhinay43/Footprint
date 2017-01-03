//
//  STLSuperVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 18/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class STLSuperVC: UIViewController
{

    //MARK:- Private methods
    @IBOutlet fileprivate var viewHeader: UIView!
    
    fileprivate var lblTitle:UILabel!
    fileprivate var btnShare:UIButton!
    
    //MARK:- Public Var
    var pageTitle:String!{
        didSet{
            lblTitle.text = pageTitle
        }
    }
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pageAppearance()
        superInitialSetting()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        lblTitle.frame = CGRect(x: 70, y: 0, width: viewHeader.frame.size.width - (70 * 2), height: viewHeader.frame.size.height)
        btnShare.frame = CGRect(x: viewHeader.frame.size.width - 35, y: 7, width: 30, height: 30)
    }
    
    
    //MARK:- Private Methods
    fileprivate func pageAppearance(){
        viewHeader.backgroundColor = Constant.GrayColor
        view.backgroundColor = Constant.GrayColor
    }
    
    fileprivate func  superInitialSetting(){
        addHeaderBarTools()
    }
    
    fileprivate func addHeaderBarTools ()
    {
        let btnGoBack = UIButton(type: .custom)
        btnGoBack.addTarget(self, action: #selector(STLSuperVC.goBack), for: .touchUpInside)
        btnGoBack.frame = CGRect(x: 5, y: 7, width: 30, height: 30)
        btnGoBack.setTitleColor(FootprintConstant.Color.FootprintBlueColor, for: .normal)
        btnGoBack.setTitle(FootprintConstant.Font.BlackTie.Text.Back, for: .normal)
        btnGoBack.titleLabel?.font = UIFont(name: FootprintConstant.Font.BlackTie.Regular, size: 17)
        viewHeader.addSubview(btnGoBack)
        
        lblTitle = UILabel(frame: CGRect(x: 70, y: 0, width: viewHeader.frame.size.width - (70 * 2), height: viewHeader.frame.size.height))
        lblTitle.textColor = FootprintConstant.Color.FootprintBlueColor
        lblTitle.backgroundColor = ClearColor
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 22.0)
        viewHeader.addSubview(lblTitle)
        
        btnShare = UIButton(type: .custom)
        btnShare.addTarget(self, action: #selector(STLSuperVC.shareAction), for: .touchUpInside)
        btnShare.frame = CGRect(x: viewHeader.frame.size.width - 35, y: 7, width: 30, height: 30)
        btnShare.setTitleColor(FootprintConstant.Color.FootprintBlueColor, for: .normal)
        btnShare.setTitle(FootprintConstant.Font.BlackTie.Text.Share, for: .normal)
        btnShare.titleLabel?.font = UIFont(name: FootprintConstant.Font.BlackTie.Regular, size: 17)
        viewHeader.addSubview(btnShare)
        
    }
    
    //MARK:-
    @objc fileprivate func goBack() {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @objc fileprivate func shareAction() {
        
    }
    
    @objc fileprivate func cartAction() {
        
    }
    
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension STLSuperVC
{
    struct Constant {
        static let GrayColor = UIColor(red: 241.0/255.0, green: 241.0/255.0, blue: 241.0/255.0, alpha: 1.0)
    }
    
}
