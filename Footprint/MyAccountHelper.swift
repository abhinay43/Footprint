//
//  MyAccountHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 14/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation

struct MyAccountRecord
{
    let title:String!
}

enum MYAccountSection:Int{
    case Info = 0, Orders, RewardPoints, ChangePassword, GiftBalance, SignOut
}

final class MyAccountHelper
{
    typealias UpdateInfoRequestCompletionHandler = (_ success:Bool, _ message:String) -> ()
    
    static let dataSource = [
        MyAccountRecord(title: "Customer Info"),
        MyAccountRecord(title: "Orders"),
        MyAccountRecord(title: "Reward Points"),
        MyAccountRecord(title: "Change Password"),
        MyAccountRecord(title: "Gift Card Balance"),
        MyAccountRecord(title: "Sign Out")
    ]
    
    class func updateUserInfo(email emailID:String, firstName fn:String, lastName ln:String, gender gen:String, dob dateOfBirth:String, dateOfBirthDay day:String, dateOfBirthMonth month:String, dateOfBirthYear year:String, company comp:String, complitionHandler handler:@escaping UpdateInfoRequestCompletionHandler)
    {
        guard let _ = UserRecordHelper.sharedInstance.userRecord?.userGUID else {
            handler(false, "Something went wrong!!")
            return
        }
        
        let params = [UserRecordHelper.Key.Email:emailID, UserRecordHelper.Key.Gender:gen, UserRecordHelper.Key.UserFirstName:fn, UserRecordHelper.Key.UserLastName:ln, UserRecordHelper.Key.Dob:dateOfBirth, UserRecordHelper.Key.DateOfBirthDay:day, UserRecordHelper.Key.DateOfBirthMonth:month, UserRecordHelper.Key.DateOfBirthYear:year, UserRecordHelper.Key.Company:comp]
        
        HTTPRequestManager.httpRequest(url: FootprintConstant.API.UpdateUserInfo, protocolMethod: .POST, parameters: params, encoding: .URL, completionHandler: { response, value, statusCode in
            
            
            switch response
            {
            case .Success:
                let dict = value as! [String:Any]
                let status = dict["success"] as! Bool
                
                if status{
                    handler(true, dict["message"] as! String)
                }else{
                    handler(false, dict["message"] as! String)
                }
                break
            case .SomethingWrong:
                handler(false, "Something went wrong!!")
                break
            }
            
        })
    }

    
}


