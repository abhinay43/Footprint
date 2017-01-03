//
//  ForgotPasswordPageHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 17/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation


class ForgotPasswordPageHelper
{
    typealias ForgotPasswordRequestCompletionHandler = (_ success:Bool, _ message:String) -> ()
    
    class func forgotPasswordAction(email emailID:String, complitionHandler handler:@escaping ForgotPasswordRequestCompletionHandler)
    {
        let params = [UserRecordHelper.Key.Email:emailID]
        
        HTTPRequestManager.httpRequest(url: FootprintConstant.API.ForgotPassword, protocolMethod: .POST, parameters: params, encoding: .URL, completionHandler: { response, value, statusCode in
            
            switch response
            {
            case .Success:
                let dict = value as! [String:Any]
                let status = dict["Success"] as! Bool
                let message = dict["Message"] as! String
                
                if status{
                  handler(true, message)
                }else{
                    handler(false, message)
                }
                break
            case .SomethingWrong:
                handler(false, "Something went wrong!!")
                break
            }
            
        })
    }
}

extension ForgotPasswordPageHelper{
    struct Key {
        static let UserName = ""
    }
}
