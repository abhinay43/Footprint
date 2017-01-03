//
//  LoginPageHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 17/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation

final class LoginPageHelper{
    let sharedInstance = LoginPageHelper()
}


//MARK:- API Call
extension LoginPageHelper
{
    typealias LoginRequestCompletionHandler = (_ success:Bool, _ message:String) -> ()
    
    class func loginWith(email emailID:String, password pass:String, complitionHandler handler:@escaping LoginRequestCompletionHandler)
    {
        let params = [UserRecordHelper.Key.Email:emailID, UserRecordHelper.Key.UserPassword:pass]
        
        HTTPRequestManager.httpRequest(url: FootprintConstant.API.Login, protocolMethod: .POST, parameters: params, encoding: .URL, completionHandler: { response, value, statusCode in
            
            switch response
            {
                case .Success:
                    let dict = value as! [String:String]
                    
                    if let email = dict[UserRecordHelper.Key.UserEmail]
                    {
                        let userRecord = UserRecord(userEmail: email, userLastName: dict[UserRecordHelper.Key.UserLastName]!, userFirstName: dict[UserRecordHelper.Key.UserFirstName]!, userGUID: dict[UserRecordHelper.Key.UserGuid]!, userAddress: "", isMale: true, isAcceptNewsLetter: false, userDOB: dict[UserRecordHelper.Key.Dob])
                        
                        UserRecordHelper.sharedInstance.isLogin = true
                        UserRecordHelper.sharedInstance.userRecord = userRecord
                        handler(true, dict["Message"]! as String)
                    }
                    else{
                        handler(false, dict["Message"]! as String)
                    }
                    
                    break
                case .SomethingWrong:
                    handler(false, "Something went wrong!!")
                    break
            }
            
        })
    }
}






