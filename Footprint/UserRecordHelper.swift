//
//  UserRecordHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 18/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation

struct UserRecord {
    let userEmail:String!
    let userLastName:String?
    let userFirstName:String?
    let userGUID:String!
    
    let userAddress:String?
    let isMale:Bool!
    let isAcceptNewsLetter:Bool!
    let userDOB:String?
}

//MARK:- Class
final class UserRecordHelper
{
    static let sharedInstance = UserRecordHelper()
    
    //MARK:- Private Vars
    let prefs = UserDefaults.standard
    
    //MARK:- Public Vars
    var isLogin:Bool{
        get{
            return prefs.bool(forKey: Key.IsLogin)
        }set{
            prefs.set(newValue, forKey: Key.IsLogin)
            if newValue == false{
                userRecord = nil
                cookie = nil
            }
            
            prefs.synchronize()
        }
    }
    
    var userRecord:UserRecord?{
        get{
            if self.isLogin{
                return UserRecord(userEmail: prefs.object(forKey: Key.UserEmail) as! String, userLastName:prefs.object(forKey: Key.UserLastName) as? String, userFirstName:prefs.object(forKey: Key.UserFirstName) as? String, userGUID: prefs.object(forKey: Key.UserGuid) as! String, userAddress: prefs.object(forKey: Key.UserAddress) as? String, isMale:prefs.bool(forKey: Key.IsMale), isAcceptNewsLetter:prefs.bool(forKey: Key.IsAcceptNewsLetter), userDOB:prefs.object(forKey: Key.Dob) as? String)
            }else{
                return nil
            }
        }
        set{
            if let newValue = newValue{
                prefs.set(newValue.userEmail, forKey: Key.UserEmail)
                prefs.set(newValue.userGUID, forKey: Key.UserGuid)
                prefs.set(newValue.userLastName, forKey: Key.UserLastName)
                prefs.set(newValue.userFirstName, forKey: Key.UserFirstName)
                prefs.set(newValue.userAddress, forKey: Key.UserAddress)
                prefs.set(newValue.userDOB, forKey: Key.Dob)
                prefs.set(newValue.isMale, forKey: Key.IsMale)
                prefs.set(newValue.isAcceptNewsLetter, forKey: Key.IsAcceptNewsLetter)
            }else{
                prefs.removeObject(forKey: Key.UserEmail)
                prefs.removeObject(forKey: Key.UserGuid)
                prefs.removeObject(forKey: Key.UserLastName)
                prefs.removeObject(forKey: Key.UserFirstName)
                
                prefs.removeObject(forKey: Key.UserAddress)
                prefs.removeObject(forKey: Key.Dob)
                prefs.set(true, forKey: Key.IsMale)
                prefs.set(false, forKey: Key.IsAcceptNewsLetter)
            }
            
            prefs.synchronize()
            
        }
    }
    
    var cookie:HTTPCookie?{
        get{
            let cookieProperties = prefs.value(forKey: "Cookie")
            return HTTPCookie(properties: cookieProperties as! [HTTPCookiePropertyKey : Any])
        }set{
            prefs.set(newValue?.properties, forKey: "Cookie")
            prefs.synchronize()
        }
    }
}

//MARK:- Extension
extension UserRecordHelper
{
    struct Key {
        static let UserLastName = "LastName"
        static let UserFirstName = "FirstName"
        static let UserConfirmPassword = "ConfirmPassword"
        static let UserEmail = "UserEmail"
        static let Email = "Email"
        static let Dob = "Dob"
        static let UserPassword = "Password"
        static let UserAddress = "Address"
        static let IsAcceptNewsLetter = "IsAcceptNewsLetter"
        static let IsMale = "IsMale"
        static let UserGuid = "UserGuid"
        static let AuthID = "AuthID"
        static let IsLogin = "isLogin"
        static let Gender = "Gender"
        static let DateOfBirthDay = "DateOfBirthDay"
        static let DateOfBirthMonth = "DateOfBirthMonth"
        static let DateOfBirthYear = "DateOfBirthYear"
        static let Company = "Company"
    }

}
