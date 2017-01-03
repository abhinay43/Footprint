//
//  ApplicationAppearanceManager.swift
//  VSearch
//
//  Created by Abhinay Maurya on 16/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ApplicationAppearanceManager
{
    static func appLoadingAppearance()
    {
        SlideMenuOptions.contentViewScale = 1.0
        SlideMenuOptions.contentViewOpacity = 0.25
        SlideMenuOptions.hideStatusBar = false
        
//        UINavigationBar.appearance().barTintColor = VoilaConstant.Color.Yellow
//        UINavigationBar.appearance().isTranslucent = false
//        UINavigationBar.appearance().tintColor = UIColor.white
//        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: UIFont(name: VoilaConstant.Font.Pertili.Light, size: 25)!,NSForegroundColorAttributeName:VoilaConstant.Color.Purple]
//        
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: VoilaConstant.Font.Pertili.Light, size: 15)!,NSForegroundColorAttributeName:VoilaConstant.Color.Purple], for: .normal)
    }
    
}
