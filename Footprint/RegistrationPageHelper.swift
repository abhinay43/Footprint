//
//  RegistrationPageHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 17/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation


final class RegistrationPageHelper
{
    
}


//MARK:- API Call
extension RegistrationPageHelper
{
    typealias RegistrationRequestCompletionHandler = (_ success:Bool, _ message:String) -> ()
    
    class func registrationWith(email emailID:String, password pass:String, lastName ln:String!, firstName fn:String!,dob birthDate:String, complitionHandler handler:@escaping RegistrationRequestCompletionHandler)
    {
        let params = [UserRecordHelper.Key.Email:emailID, UserRecordHelper.Key.UserPassword:pass, UserRecordHelper.Key.UserConfirmPassword:pass, UserRecordHelper.Key.UserLastName:ln, UserRecordHelper.Key.UserFirstName: fn, UserRecordHelper.Key.Dob:birthDate]
        
        HTTPRequestManager.httpRequest(url: FootprintConstant.API.Registration, protocolMethod: .POST, parameters: params, encoding: .URL, completionHandler: { response, value, statusCode in
            
            switch response
            {
                case .Success:
                    let dict = value as! [String:String]
                    
                    if let email = dict[UserRecordHelper.Key.UserEmail]
                    {
                        let userRecord = UserRecord(userEmail: email, userLastName: dict[UserRecordHelper.Key.UserLastName]!, userFirstName: dict[UserRecordHelper.Key.UserFirstName]!, userGUID: dict[UserRecordHelper.Key.UserGuid]!, userAddress: "", isMale: true, isAcceptNewsLetter: false, userDOB: dict[UserRecordHelper.Key.Dob])
                       // let userRecord = UserRecord(userEmail: email, userLastName: ln, userFirstName: fn, userGUID: dict[UserRecordHelper.Key.UserGuid]!, userAddress: "", isMale: true, isAcceptNewsLetter: false, userDOB: birthDate)
                        
                        UserRecordHelper.sharedInstance.isLogin = true
                        UserRecordHelper.sharedInstance.userRecord = userRecord
                        handler(true, dict["Message"]!)
                    }else{
                        handler(false, dict["Message"]! as String)
                    }
                    
                    
                    break
                case .SomethingWrong:
                    handler(false, "Something went wrong!!")
                    break
            }
            
        })
    }
    
    
    class func fbRegistrationWith(email emailID:String, password pass:String, lastName ln:String!, firstName fn:String!, complitionHandler handler:@escaping RegistrationRequestCompletionHandler)
    {
        let params = [UserRecordHelper.Key.Email:emailID, UserRecordHelper.Key.UserPassword:pass, UserRecordHelper.Key.UserConfirmPassword:pass, UserRecordHelper.Key.UserLastName:ln, UserRecordHelper.Key.UserFirstName: fn]
        
        HTTPRequestManager.httpRequest(url: FootprintConstant.API.FBRegistration, protocolMethod: .POST, parameters: params, encoding: .URL, completionHandler: { response, value, statusCode in
            
            switch response
            {
            case .Success:
                let dict = value as! [String:String]
                
                if let email = dict[UserRecordHelper.Key.UserEmail]
                {
                   // let userRecord = UserRecord(userEmail: email, userLastName: dict[UserRecordHelper.Key.UserLastName]!, userFirstName: dict[UserRecordHelper.Key.UserFirstName]!, userGUID: dict[UserRecordHelper.Key.UserGuid]!, userAddress: "", isMale: true, isAcceptNewsLetter: false, userDOB: dict[UserRecordHelper.Key.Dob])
                    
                    let userRecord = UserRecord(userEmail: email, userLastName: "", userFirstName: "", userGUID: dict[UserRecordHelper.Key.UserGuid]!, userAddress: "", isMale: true, isAcceptNewsLetter: false, userDOB: nil)
                    
                    UserRecordHelper.sharedInstance.isLogin = true
                    UserRecordHelper.sharedInstance.userRecord = userRecord
                    handler(true, dict["Message"]!)
                }else{
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


