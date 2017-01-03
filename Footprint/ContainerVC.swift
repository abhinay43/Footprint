//
//  ContainerVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 13/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ContainerVC: SlideMenuController
{

    //MARK:- View Life Cycle
    override func awakeFromNib()
    {
        mainViewController = MainNavigationVC.instantiate()
        leftViewController = LeftMenuNavigationVC.instantiate()
        
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:-
    override var prefersStatusBarHidden: Bool{
        return true
    }

    
}

/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension

extension ContainerVC
{
    struct Storyboard {
        static let ControllerID = String(describing: ContainerVC.self)
    }
    
    //MARK:- Static Method
    static func instantiate() -> ContainerVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Main, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! ContainerVC
    }
}

