//
//  LoginNavVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 03/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class LoginNavVC: UINavigationController
{

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension LoginNavVC
{
    struct Storyboard{
        static let ControllerID = "LoginNavVC"
    }
    
    //MARK:- Static Method
    static func instantiate() -> LoginNavVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Login, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! LoginNavVC
    }
    
}
