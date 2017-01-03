//
//  FBLoginHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 10/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation
import FacebookCore
import FacebookLogin


typealias FBLoginCompletionHandler = (_ success:Bool, _ message:String) -> ()

final class FBLoginHelper
{
    //Login
    class func login(completionHandler:@escaping FBLoginCompletionHandler)
    {
        if AccessToken.current != nil{
            FBLoginHelper.getUserEmail(completionHandler: completionHandler)
        }
        else{
            let loginManager = LoginManager()
            
            loginManager.logIn([ReadPermission.custom("public_profile"),ReadPermission.custom("email")], viewController: nil) { loginResult in
                
                switch loginResult
                {
                    case .failed(let error):
                        completionHandler(false, error.localizedDescription)
                    case .cancelled:
                        completionHandler(false, "User cancelled login.")
                    case .success( _, _, _):
                        FBLoginHelper.getUserEmail(completionHandler: completionHandler)
                }
            }
        }
    }
    
    //Access User Info
    fileprivate class func getUserEmail (completionHandler:@escaping FBLoginCompletionHandler)
    {
        let connection = GraphRequestConnection()
        var graphRequest = GraphRequest(graphPath: "/me")
        graphRequest.parameters = ["fields": "email, name"]
        
        connection.add(graphRequest) { httpResponse, result in
            switch result
            {
                case .success(let response):
                    
                    if let record = response.dictionaryValue
                    {
                       let email = record["email"] as! String
                        let fName = record["name"] as! String
                        let fbid = "\(record ["id"]!)"
                        
                        RegistrationPageHelper.fbRegistrationWith(email: email, password: fbid, lastName: "", firstName: fName, complitionHandler: { (success, message) in
                            completionHandler (success, message)
                            })
                        
                    }else{
                        completionHandler (false, "Failed")
                    }
                
                case .failed( _):
                    completionHandler (false, "Failed")
            }
        }
        connection.start()
    }
    
    //LogOut
    class func logout()
    {
        let loginManager = LoginManager()
        loginManager.logOut()
    }
}




