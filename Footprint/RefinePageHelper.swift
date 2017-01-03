//
//  RefinePageHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 11/11/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation

enum RefineTypes:Int{
    case Style = 0, Size, Color, Material, Sole, None
}



struct RefineType {
    let title:String!
    let imageName:String!
    var selectedTitle:String?
}

struct RefineColorType {
    let title:String!
}

struct RefineSizeType {
    let title:String!
}

struct RefineStyleType {
    let title:String!
}

struct RefineMaterialType {
    let title:String!
}

struct RefineSoleType {
    let title:String!
}


struct RefineInCategory {
    let title:String!
}

final class RefinePageHelper
{
    static let refineTypes = [
        RefineType(title: "Style", imageName: "refine_style", selectedTitle:nil),
        RefineType(title: "Size", imageName: "refine_size", selectedTitle:nil),
        RefineType(title: "Color", imageName: "refine_color", selectedTitle:nil),
        RefineType(title: "Material", imageName: "refine_material", selectedTitle:nil),
        RefineType(title: "Sole", imageName: "refine_sole", selectedTitle:nil)
    ]
    
    static let refineColors = [
        RefineColorType(title: "Black"),
        RefineColorType(title: "Brown"),
        RefineColorType(title: "Dark brown"),
        RefineColorType(title: "Light brown")
    ]
    
    
    static let refineSizes = [
        RefineSizeType(title: "Size 1"),
        RefineSizeType(title: "Size 2"),
        RefineSizeType(title: "Size 3"),
        RefineSizeType(title: "Size 4"),
        RefineSizeType(title: "Size 5"),
        RefineSizeType(title: "Size 6")
    ]
    
    static let refineStyles = [
        RefineStyleType(title: "MS"),
        RefineStyleType(title: "AS"),
        RefineStyleType(title: "BS"),
        RefineStyleType(title: "CS"),
        RefineStyleType(title: "DS")
    ]
    
    static let refineMaterial = [
        RefineMaterialType(title: "Material 1"),
        RefineMaterialType(title: "Material 2"),
        RefineMaterialType(title: "Material 3"),
        RefineMaterialType(title: "Material 4"),
        RefineMaterialType(title: "Material 5"),
        RefineMaterialType(title: "Material 6")
    ]
    
    static let refineSole = [
        RefineSoleType(title: "Sole1"),
        RefineSoleType(title: "Sole2"),
        RefineSoleType(title: "Sole3"),
        RefineSoleType(title: "Sole4")
    ]

    
    static let refineInCategory = [
        RefineInCategory(title: "Men"),
        RefineInCategory(title: "Accessories"),
        RefineInCategory(title: "Sale"),
        RefineInCategory(title: "Not Sale"),
        RefineInCategory(title: "Both")
    ]
    
}


extension RefinePageHelper
{
    struct PriceRange {
        static let Min = 0
        static let Max = 10000
    }
}
