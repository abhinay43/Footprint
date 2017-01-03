//
//  LinkedInHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 13/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

//Steps
//Create an app on linked in + add Linkedin sdk (libkern) in your project

//1: In App Delegate opne URL delegate add following line
//return LISDKCallbackHandler.application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String!, annotation: options[UIApplicationOpenURLOptionsKey.annotation])

//2: In plist add: Key:Value(App ID) -> LIAppId : 4866475
//3: In plist add: Key:Valueli(App ID) -> URL Schemes : li4866475

//4: Create Session with Auth
//5: Login

import Foundation
import libkern

typealias LinkedInCompletionHandler = (_ success:Bool, _ message:String) -> ()

final class LinkedInHelper
{
     fileprivate class func authenticateUser (completionHandler:@escaping LinkedInCompletionHandler)
    {
        if LISDKSessionManager.hasValidSession(){
            LinkedInHelper.loginAction(completionHandler: completionHandler)
        }else{
            LinkedInHelper.authenticateWithoutToken(completionHandler: completionHandler)
        }
    }
    
    fileprivate class func authenticateWithoutToken(completionHandler:@escaping LinkedInCompletionHandler)
    {
        LISDKSessionManager.createSession(withAuth: [LISDK_BASIC_PROFILE_PERMISSION, LISDK_EMAILADDRESS_PERMISSION], state: nil, showGoToAppStoreDialog: true, successBlock: { returnState in
            LinkedInHelper.loginAction(completionHandler: completionHandler)
        }, errorBlock: { error in
            completionHandler(false, (error?.localizedDescription)!)
        })
    }
    
    fileprivate class func loginAction (completionHandler:@escaping LinkedInCompletionHandler)
    {
        let url = "https://api.linkedin.com/v1/people/~:(id,first-name,last-name,email-address)"
        LISDKAPIHelper.sharedInstance().getRequest(url, success: {response in
            if let record = response?.data?.convertToDictionary()
            {
                let email = record["emailAddress"] as! String
                let fName = record["firstName"] as! String
                let linId = "\(record ["id"]!)"
                
                RegistrationPageHelper.fbRegistrationWith(email: email, password: linId, lastName: "", firstName: fName, complitionHandler: { (success, message) in
                    completionHandler (success, message)
                })
                
            }else{
               completionHandler(false, "Data not retrived.")
            }
            
        }, error: {error in
            print(error ?? "")
            completionHandler(false, "Failed")
        })
    }
    

    
    class func login(completionHandler:@escaping LinkedInCompletionHandler){
        LinkedInHelper.authenticateUser(completionHandler: completionHandler)
    }
    
    class func logOut(){
        LISDKSessionManager.clearSession()
    }
    
}
