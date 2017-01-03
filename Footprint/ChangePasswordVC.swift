//
//  ChangePasswordVC.swift
//  Footprint
//
//  Created by Abhinay Maurya on 15/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit

class ChangePasswordVC: HeaderVC
{
    //MARK:- IBOutlet
    @IBOutlet fileprivate weak var txtOldPassword: UITextField!
    @IBOutlet fileprivate weak var txtNewPassword: UITextField!
    @IBOutlet fileprivate weak var txtConfirmPassword: UITextField!

    //MARK:- ViewC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetting()
        self.pageAppearance()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Private Methods
    fileprivate func initialSetting(){
        pageTitle = "CHANGE PASSWORD"
    }
    fileprivate func pageAppearance(){
        self.view.backgroundColor = FootprintConstant.Color.FootprintBlueColor
        isHideBackgroundImage = true
    }

    //MARK:- IBAction

    @IBAction func changePasswordAction(_ sender: UIButton) {
    }
}

/* ---------------------------------- Extension ----------------------------------------- */
//MARK:- Extension
extension ChangePasswordVC
{
    struct Storyboard{
        static let ControllerID = String(describing: ChangePasswordVC.self)
        static let SegueID = "ChangePasswordSegue"
    }
    
    //MARK:- Static Metod
    static func instantiate() -> ChangePasswordVC{
        let storyboard = UIStoryboard(name: FootprintConstant.Storyboard.MyAccount, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: Storyboard.ControllerID) as! ChangePasswordVC
    }
}
