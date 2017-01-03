//
//  DashboardHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 08/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation


enum DashboardCategory:Int{
    case Shoes = 0, Brand, ShopTheLook, Bespoke, Blog, Plus
}

//MARK:- Structure
struct Dashboard {
    let title:String!
    let imageName:String!
}

//MARK:- Class
final class DashboardHelper{
    
    static let dataSource = [
        Dashboard(title: "SHOES", imageName: "Shoes"),
        Dashboard(title: "BRAND", imageName: "Brand"),
        Dashboard(title: "SHOP THE LOOK", imageName: "Shopthelook"),
        Dashboard(title: "BESPOKE", imageName: "Bespoke"),
        Dashboard(title: "BLOG", imageName: "Instagram"),
        Dashboard(title: "PLUS", imageName: "")
    ]
}

//MARK:- Extension
extension DashboardHelper{
    
}
