//
//  GeneralManager.swift
//  VSearch
//
//  Created by Abhinay Maurya on 06/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

final class GeneralManager
{
    static let sharedInstance = GeneralManager()
    
    class func applicationInitialSetUp()
    {
        //#1
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().shouldResignOnTouchOutside =  true
        IQKeyboardManager.sharedManager().placeholderFont = UIFont(name: FootprintConstant.Font.Montserrat.Regular, size: 15.0)
        IQKeyboardManager.sharedManager().shouldHidePreviousNext = false
        
        //#2
        //If user has logged in once then save the last cookies which we got after registration/login
        if UserRecordHelper.sharedInstance.isLogin
        {
            HTTPCookieStorage.shared.setCookie(UserRecordHelper.sharedInstance.cookie!)
        }
        
        //#3
        ApplicationAppearanceManager.appLoadingAppearance()
        
    }
}
