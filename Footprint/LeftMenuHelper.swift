//
//  LeftMenuHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 13/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation

struct LeftMenuRecord {
    let title:String!
    let imageName:String!
}

enum Menu:Int{
    case Dashboard = 0, MyJourney, Gift, Blog, MyAccount, LoyaltyProgram, ShoeRack
}


class LeftMenuHelper
{
    static let dataSource = [
        LeftMenuRecord(title:"Home", imageName:""),
        LeftMenuRecord(title:"My Journey", imageName:""),
        LeftMenuRecord(title:"Gift", imageName:""),
        LeftMenuRecord(title:"Blog", imageName:""),
        LeftMenuRecord(title:"My Account", imageName:""),
        LeftMenuRecord(title:"Loyalty Program", imageName:""),
        LeftMenuRecord(title:"Shoe Rack", imageName:"")
    ]
    
}
