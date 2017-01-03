//
//  BrandVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 15/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class BrandVC: SuperContainerVC
{

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension BrandVC
{
    struct Storyboard{
        static let ControllerID = String(describing: BrandVC.self)
    }
    
    //MARK:- Static Metod
    static func instantiate() -> BrandVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Main, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! BrandVC
    }
    
}
