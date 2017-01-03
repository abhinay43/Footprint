//
//  MainNavigationVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 05/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class MainNavigationVC: UINavigationController
{

    //MARK:- ViewCLife Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Public Apis
    
    //MARK:-
    override var prefersStatusBarHidden: Bool{
        return true
    }


}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension MainNavigationVC
{
    struct Storyboard {
        static let ControllerID = String(describing: MainNavigationVC.self)
    }
    static func instantiate() -> MainNavigationVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Main, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! MainNavigationVC
    }

    
}

