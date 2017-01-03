//
//  InstagramVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 15/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class InstagramVC: SuperContainerVC
{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension InstagramVC
{
    struct Storyboard{
        static let ControllerID = String(describing: InstagramVC.self)
    }
    
    //MARK:- Static Metod
    static func instantiate() -> InstagramVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Main, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! InstagramVC
    }
    
}
