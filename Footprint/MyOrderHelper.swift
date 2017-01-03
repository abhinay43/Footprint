//
//  MyOrderHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 15/12/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation

struct MyOrder {
    let status:String!
    let date:Date!
    let total:String!
    let number:String!
}

final class MyOrderHelper
{
    static let dataSource = [
        MyOrder(status: "Processing", date: Date(), total: "Pkr. 10000", number:"01"),
        MyOrder(status: "Completed", date: Date(), total: "Pkr. 20000", number:"0123"),
        MyOrder(status: "In Review", date: Date(), total: "Pkr. 30000", number:"0234"),
        MyOrder(status: "Processing", date: Date(), total: "Pkr. 4430000", number:"023"),
        MyOrder(status: "Processing", date: Date(), total: "Pkr. 10000", number:"0144"),
    ]
}
