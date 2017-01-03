//
//  LeftMenuNavigationVC.swift
//  Voila
//
//  Created by Abhinay Maurya on 15/07/16.
//  Copyright © 2016 Voila. All rights reserved.
//

import UIKit

class LeftMenuNavigationVC: UINavigationController
{
    //MARK:- View Life Cycle
    override func viewDidLoad(){
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension

extension LeftMenuNavigationVC
{
    struct Storyboard {
        static let ControllerID = String(describing: LeftMenuNavigationVC.self)
    }
    
    static func instantiate() -> LeftMenuNavigationVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Main, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! LeftMenuNavigationVC
    }
}
