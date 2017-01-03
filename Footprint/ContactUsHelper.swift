//
//  ContactUsHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 29/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation

struct ContactUsRecord {
    let title:String!
    let isTextView:Bool!
    let key:String!
}

final class ContactUsHelper
{
    static let numberOfTextView = 1
    
    static let dataSource = [
        ContactUsRecord(title: "First Name", isTextView:false, key:Key.FirstName),
        ContactUsRecord(title: "Last Name", isTextView:false, key:Key.LastName),
        ContactUsRecord(title: "Contact", isTextView:false, key:Key.Contact),
        ContactUsRecord(title: "Email", isTextView:false, key:Key.Email),
        ContactUsRecord(title: "Enquiry", isTextView:true, key:Key.Enquiry)
    ]
}

extension ContactUsHelper
{
    struct Key {
        static let FirstName = "FirstName"
        static let LastName = "LastName"
        static let Email = "Email"
        static let Contact = "Contact"
        static let Enquiry = "Enquiry"
    }
}
