//
//  ProductHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 09/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation


enum ProductOption:Int{
    case Info = 0, Color, Size, Share, None
}

enum ProductInfo:Int{
    case Information = 0, Shipping, Wishlist, Share
}

struct ProductColorInfo
{
    let name:String!
    let color:UIColor!
}


struct Product
{
    let imageURL:String?
    let productTitle:String!
    let productCost:String!
}


final class ProducPageHelper
{
    static let dataSource = [
        Product(imageURL:"Brand3", productTitle:"Shoe 1", productCost:"200"),
        Product(imageURL:"Brand3", productTitle:"Shoe 2", productCost:"500"),
        Product(imageURL:"Brand3", productTitle:"Shoe 3", productCost:"5500"),
        Product(imageURL:"Brand3", productTitle:"Shoe 4", productCost:"400"),
        Product(imageURL:"Brand3", productTitle:"Shoe 5", productCost:"1100"),
        Product(imageURL:"Brand3", productTitle:"Shoe 6", productCost:"4500"),
        Product(imageURL:"Brand3", productTitle:"Shoe 7", productCost:"200"),
        Product(imageURL:"Brand3", productTitle:"Shoe 8", productCost:"400"),
        Product(imageURL:"Brand3", productTitle:"Shoe 9", productCost:"600"),
        Product(imageURL:"Brand3", productTitle:"Shoe 10", productCost:"900"),
        Product(imageURL:"Brand3", productTitle:"Shoe 11", productCost:"1000"),
    ]
    
    static let productInfoTitles = ["Product Info", "Shipping & Return", "Wishlist", "Share"]
    
    static let productColors = [
        ProductColorInfo(name: "Black", color: BlackColor),
        ProductColorInfo(name: "Dark Brown Shaded", color: UIColor.darkText),
        ProductColorInfo(name: "Brown", color: UIColor.brown),
        ProductColorInfo(name: "Red", color: UIColor.red),
        ProductColorInfo(name: "Gray", color: Gray),
        ProductColorInfo(name: "Dark Gray", color: DarkGray)
    ]
    
    static let productSizes = ["38", "39", "40", "41", "41", "43", "44", "45", "46", "47", "48", "49"]
    static let sharingMedia = ["fb", "twitter", "what", "g+", "pinterest"]
}

extension ProducPageHelper
{
    
}
