//
//  ShoeCaegoryHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 08/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation

//MARK:- Structure
struct ShoeBrand {
    let title:String!
    let imageName:String!
}

//MARK:- Class
final class ShoeBrandHelper{
    
    static let dataSource = [
        
        ShoeBrand(title: "CLASSIC", imageName: "Brand1"),
        ShoeBrand(title: "EVERGREEN", imageName: "Brand"),
        ShoeBrand(title: "CASUAL", imageName: "Brand3"),
        ShoeBrand(title: "FORMAL", imageName: "Brand4"),
        ShoeBrand(title: "EASTERN", imageName: "Brand5")
    ]
}

//MARK:- Extension
extension ShoeBrandHelper{
   
}
