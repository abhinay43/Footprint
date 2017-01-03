//
//  PlusHelper.swift
//  Footprint
//
//  Created by Abhinay Maurya on 09/10/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import Foundation

//MARK:- Structure
struct PlusRecord
{
    let headerTitle:String!
    let titleFirst:String!
    let titleSecond:String!
    let descriptionFirst:String!
    let descriptionSecond:String!
}

//MARK:- Class
final class PlusHelper{
    
    static let dataSource:[PlusRecord] = {
        return [
            PlusRecord(headerTitle:"FAQ", titleFirst:"Terms & Condition", titleSecond:"Indemnification", descriptionFirst:Config.TermsAndCondition, descriptionSecond:Config.Indemnification),
            PlusRecord(headerTitle:"How To Use", titleFirst:"Terms & Condition", titleSecond:"Indemnification", descriptionFirst:Config.TermsAndCondition, descriptionSecond:Config.Indemnification),
            PlusRecord(headerTitle:"News Letter", titleFirst:"Terms & Condition", titleSecond:"Indemnification", descriptionFirst:Config.TermsAndCondition, descriptionSecond:Config.Indemnification),
            PlusRecord(headerTitle:"What Next", titleFirst:"Terms & Condition", titleSecond:"Indemnification", descriptionFirst:Config.TermsAndCondition, descriptionSecond:Config.Indemnification),
            PlusRecord(headerTitle:"Contact US", titleFirst:"Terms & Condition", titleSecond:"Indemnification", descriptionFirst:Config.TermsAndCondition, descriptionSecond:Config.Indemnification)
        ]
    }()
}

//MARK:- Extension
extension PlusHelper
{
  
}
