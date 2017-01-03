//
//  HTTPRequestManager.swift
//  Recycle
//
//  Created by Abhinay Maurya on 04/08/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Alamofire

final class HTTPRequestManager
{
    enum HTTPResponse : String{
        case Success, SomethingWrong
    }
    
    enum ProtocolMethod:String{
        case GET, POST, PUT
    }
    
    enum ProtocolEncoding:String{
        case URL, JSON
    }
    
    
    typealias HTTPRequestCompletionHandler = (_ response:HTTPResponse, _ value:AnyObject?, _ statusCode:Int?) -> ()
    
    static fileprivate let Header = ["Content-Type": "application/x-www-form-urlencoded"]
    
    class func httpRequest(url urlString:String, protocolMethod method:ProtocolMethod, parameters params:Any, encoding:ProtocolEncoding, completionHandler:@escaping HTTPRequestCompletionHandler)
    {
        let requestProtocolMetohd:HTTPMethod
        
        switch method
        {
            case .GET:
                requestProtocolMetohd = .get
                break
            case .POST:
                requestProtocolMetohd = .post
                break
            case .PUT:
                requestProtocolMetohd = .put
                break
        }
        
        let requestEncoding:ParameterEncoding
        
        switch encoding
        {
            case .URL:
                requestEncoding = URLEncoding()
                break
            case .JSON:
                requestEncoding = JSONEncoding()
                break
        }
        
        
        Alamofire.request(urlString, method: requestProtocolMetohd, parameters: params as? [String:AnyObject], encoding: requestEncoding, headers:HTTPRequestManager.Header).responseJSON { response in
           
            let statusCode = response.response?.statusCode
            print(response)
            
            //Save cookie only when login/registration to add in headers
            if let headerFields = response.response?.allHeaderFields as? [String: String], let url = response.request?.url
            {
                if urlString == FootprintConstant.API.Login || urlString == FootprintConstant.API.Registration || urlString == FootprintConstant.API.FBRegistration{
                   
                    let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: url)
                    let cookie = cookies[1]
                    UserRecordHelper.sharedInstance.cookie = cookie
                }
            }
            
            
            if let value = response.result.value{
                completionHandler(HTTPResponse.Success, value as AnyObject?, statusCode)
            }else{
                completionHandler(HTTPResponse.SomethingWrong, response.result.value as AnyObject? , statusCode)
            }
        }

    }
    

}

