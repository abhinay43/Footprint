//
//  ShopTheLookHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 15/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation


struct ShopTheLookProduct {
    let productName:String!
    let productImageURL:String!
    let subProductImageURLs:[String]!
}

class ShopTheLook
{
    static let dataSource = [
        ShopTheLookProduct(productName:"Product 1", productImageURL: "Brand1", subProductImageURLs:["refine_size", "refine_sole"]),
        ShopTheLookProduct(productName:"Product 2", productImageURL: "Brand2", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 3", productImageURL: "Brand3", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 4", productImageURL: "Brand4", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 5", productImageURL: "Brand5", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 6", productImageURL: "Brand1", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 7", productImageURL: "Brand2", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 8", productImageURL: "Brand3", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 9", productImageURL: "Brand4", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 10", productImageURL: "Brand5", subProductImageURLs:["refine_size", "refine_color"])
    ]
    
    static let dataSource2 = [
        ShopTheLookProduct(productName:"Product 1", productImageURL: "Brand5", subProductImageURLs:["refine_size", "refine_color"]),
        ShopTheLookProduct(productName:"Product 2", productImageURL: "Brand3", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 3", productImageURL: "Brand1", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 4", productImageURL: "Brand4", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 5", productImageURL: "Brand2", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 6", productImageURL: "Brand5", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 7", productImageURL: "Brand3", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 8", productImageURL: "Brand1", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 9", productImageURL: "Brand4", subProductImageURLs:["refine_size", "refine_sole", "refine_color"]),
        ShopTheLookProduct(productName:"Product 10", productImageURL: "Brand2", subProductImageURLs:["refine_sole", "refine_color"]),
    ]
}
