//
//  SideMenuVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 26/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit
import LGSideMenuController

class SideMenuVC: LGSideMenuController
{

    //MARK:- Private Var
    let leftViewController = LeftMenuNavigationVC.instantiate()
    
    //MARK:- View Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let mainViewController = MainNavigationVC.instantiate()
        self.rootViewController = mainViewController

        self.setLeftViewEnabledWithWidth(250, presentationStyle: .scaleFromBig, alwaysVisibleOptions:[])
        let view = leftViewController.view
        leftView()?.addSubview(view!)
        
        NotificationCenter.default.addObserver(self, selector: #selector(SideMenuVC.cancelTouch(notification:)), name: NSNotification.Name(rawValue: SideMenuVC.NotificationCancelsTouchesInView), object: nil)
        
    }
    
    @objc fileprivate func cancelTouch (notification:Notification)
    {
        self.cancelPanGuestureTouch(inView: notification.object as! Bool)
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

/* ---------------------------------- Extension --------------------------------------- */
//MARK:- Extension

extension SideMenuVC
{
    struct Storyboard {
        static let ControllerID = String(describing: SideMenuVC.self)
    }
    
    static let NotificationCancelsTouchesInView = "cancelsTouchesInView"
    
    //MARK:- Static Method
    static func instantiate() -> SideMenuVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.Main, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! SideMenuVC
    }
}


