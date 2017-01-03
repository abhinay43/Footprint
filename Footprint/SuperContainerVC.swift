//
//  SuperContainerVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 18/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class SuperContainerVC: UIViewController
{

     //MARK:- Public Vars
    var isHideBackgroundImage = false{
        didSet{
            bgImage.isHidden = isHideBackgroundImage
        }
    }
    
    //MARK:- Private Vars
    fileprivate var viewHeader: UIView!
    fileprivate var btnMenu: UIButton!
    fileprivate let bgImage = UIImageView()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pageAppearance()
        initialSetting()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Private Apis
    
    fileprivate func pageAppearance (){
        view.backgroundColor = FootprintConstant.Color.FootprintBlueColor
    }
    
    fileprivate func initialSetting (){
        addHeaderBar()
        addBGImage()
    }
    
    fileprivate func addHeaderBar ()
    {
        viewHeader = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44.0))
        viewHeader.backgroundColor = ClearColor
        view.addSubview(viewHeader)
        addLeftMenuButton()
    }
    
    fileprivate func addLeftMenuButton ()
    {
        
        btnMenu = UIButton(type: .custom)
        btnMenu.addTarget(self, action: #selector(SuperContainerVC.openLeftMenu), for: .touchUpInside)
        btnMenu.frame = CGRect(x: 15, y: 7, width: 30, height: 30)
        btnMenu.setTitleColor(WhiteColor, for: .normal)
        
        if (self.navigationController?.viewControllers.count)! > 1 {
            btnMenu.setTitle(FootprintConstant.Font.BlackTie.Text.Back, for: .normal)
        }else{
            btnMenu.setTitle(FootprintConstant.Font.BlackTie.Text.ThreeLine, for: .normal)
        }
        
        
        btnMenu.titleLabel?.font = UIFont(name: FootprintConstant.Font.BlackTie.FamilyName, size: 17)
        viewHeader.addSubview(btnMenu)
    }
    
    fileprivate func addBGImage()
    {
        bgImage.frame = view.frame
        bgImage.image = UIImage(named: "BG")
        view.addSubview(bgImage)
        view.sendSubview(toBack: bgImage)
    }
    
    
    //MARK:-
    @objc fileprivate func openLeftMenu()
    {
        if (self.navigationController?.viewControllers.count)! > 1 {
            let _ = self.navigationController?.popViewController(animated: true)
        }else{
            self._sideMenuController()?.showLeftView(animated: true, completionHandler: nil)
        }
        
    }
    
}
