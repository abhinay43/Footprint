//
//  MyRewardHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 16/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation

struct MyReward
{
    let membershipPoints:Int!
    let sharingPoints:Int!
    let reviewPoints:Int!
    let referAFriendPoints:Int!
    let previousBalancePoints:Int!
    let earnedPoints:Int!
    let redeemedPoints:Int!
    
    fileprivate func getCurrentBalance () -> Int{
        return membershipPoints + sharingPoints + reviewPoints + referAFriendPoints + previousBalancePoints + earnedPoints - redeemedPoints
    }
    
    func getValueAt(index:Int) -> Int
    {
        switch index
        {
            case 0:
                    return membershipPoints
            case 1:
                return sharingPoints
            case 2:
                return reviewPoints
            case 3:
                return referAFriendPoints
            case 4:
                return previousBalancePoints
            case 5:
                return earnedPoints
            case 6:
                return redeemedPoints
            case 7:
                return getCurrentBalance()
            default:
                return 0
        }
    }
}


final class MyRewardHelper
{
    static let dataSourceTitles = [
        "MEMBERSHIP",
        "SHARING",
        "REVIEWS",
        "REFER A FRIEND",
        "PREVIOUS BALANCE",
        "EARNED TODAY",
        "REDEEMED",
        "CURRENT BALANCE"
    ]
    
    static let dataSource = MyReward(membershipPoints: 5000, sharingPoints: 400, reviewPoints: 150, referAFriendPoints: 0, previousBalancePoints: 3000, earnedPoints: 600, redeemedPoints: 3600)
}
