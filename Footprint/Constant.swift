//
//  Constant.swift
//  Footprint
//
//  Created by Abhinay Maurya on 03/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation
import UIKit

struct FootprintConstant
{
    struct Storyboard {
        static let Main = "Main"
        static let Login = "Login"
        static let Product = "Product"
        static let ShopTheLook = "ShopTheLook"
        static let MyAccount = "MyAccount"
        static let Blog = "Blog"
    }
    
    struct Color {
        static let FootprintBlueColor = UIColor(red: 5.0/255.0, green: 28.0/255.0, blue: 59.0/255.0, alpha: 1.0)
        static let FootprintGreenColor = UIColor(red: 139.0/255.0, green: 164.0/255.0, blue: 167.0/255.0, alpha: 1.0)
    }
    
    struct Animation {
        static let Duration = 0.33
    }
    
    struct CornerRadius {
        static let Default:CGFloat = 3.0
    }
    
    struct Font
    {
        struct BlackTie
        {
            static let FamilyName = "Black Tie"
            
            static let Regular = "BlackTie-Regular"
            static let Light   = "BlackTie-Light"
            static let Solid   = "BlackTie-Solid"
            
            struct Text {
                static let RadioChecked   = ""
                static let RadioUnChecked = ""
                static let Camera         = ""
                static let Home           = ""
                static let Category       = ""
                static let Map            = ""
                static let Comments       = ""
                static let User           = ""
                static let Recycle        = ""
                static let Setting        = ""
                static let Star           = ""
                static let Back           = ""
                static let Search         = ""
                static let ShoppingCart   = ""
                static let FourSquare     = ""
                static let SixSquare      = ""
                static let Flask          = ""
                static let Menu           = ""
                static let Square         = ""
                static let Share          = ""
                static let Play           = ""
                static let ThreeLine      = ""
                static let Check          = ""
            }
        }
        
        struct Montserrat {
            static let FamilyName = "Montserrat"
            
            static let Regular = "Montserrat-Regular"
            static let Solid   = "Montserrat-Solid"
        }
        
        struct AbrilFatface {
            static let FamilyName = "Abril Fatface"
        }
    }
    
    
    struct Alert {
        static let Warning = "Alert!!"
        static let Error = "Error!!"
        static let Success = "Success!!"
    }
    
    struct Social
    {
        static let LinkedInAppID = "4866475"
        static let FBAppID = "1697465250582600"
    }
    
    struct API {
        //static let BaseAPI      = "http://gstextile.pk/"
        static let BaseAPI        = "http://stage.growonlinepk.com/soa/"
        static let Login          = BaseAPI + "Customerx/LoginUser"
        static let ForgotPassword = BaseAPI + "Customerx/RecoverPassword"
        static let Registration   = BaseAPI + "Customerx/RegisterUser"
        static let FBRegistration = BaseAPI + "Customerx/LoginFacebookUser"
        static let Topmenu        = BaseAPI + "Catalogx/TopMenu"
        static let UpdateUserInfo = BaseAPI + "Customerx/info"
    }

}

/*font-family: 'Montserrat', sans-serif;
font-family: 'Abril Fatface', cursive;*/
