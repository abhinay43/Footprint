//
//  BespokeVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 15/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class BespokeVC: SuperContainerVC
{

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension BespokeVC
{
    struct Storyboard{
        static let ControllerID = String(describing: BespokeVC.self)
    }
    
    //MARK:- Static Metod
    static func instantiate() -> BespokeVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Main, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! BespokeVC
    }
    
}
