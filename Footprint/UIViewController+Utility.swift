//
//  UIViewController+MBProgressHud.swift
//  LiqudeHire
//
//  Created by Abhinay on 16/03/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit
import MBProgressHUD
import LGSideMenuController

//MARK:- MBProgressHUD
extension UIViewController
{
    func showLoadIndicator(title text:String) {
        DispatchQueue.main.async {
            let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            hud.label.text = text
        }
        
    }
    
    func hideLoadIndicator(){
         DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    func _sideMenuController() -> LGSideMenuController?
    {
        if UIApplication.shared.delegate?.window??.rootViewController is LGSideMenuController {
           return UIApplication.shared.delegate?.window??.rootViewController as? LGSideMenuController
        }
        return nil
    }
    
    
    func showAlert(title titleText:String, message messageText:String)
    {
        let alert = UIAlertController (title:titleText, message: messageText, preferredStyle: .alert)
        let okAction = UIAlertAction (title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    
    
}

//MARK:- Other
extension UIViewController
{
}
