//
//  CoreDataHelper.swift
//  GeoMapper
//
//  Created by Abhinay Maurya on 10/06/16.
//  Copyright © 2016 ONS. All rights reserved.
//

import UIKit
import CoreData

class  CoreDataHelper
{
    
    static let sharedInstance = CoreDataHelper()
    static let successKey = "Success"
    
    lazy var managedObjectContex:NSManagedObjectContext = {
        let managedObjectContex = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        return managedObjectContex
        
    }()
    
    func syncContext () -> String {
        do {
            try self.managedObjectContex.save()
        }
        catch let error as NSError {
            return error.description
        }
        return CoreDataHelper.successKey
    }
    
}
