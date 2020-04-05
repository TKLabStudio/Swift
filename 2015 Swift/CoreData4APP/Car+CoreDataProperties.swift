//
//  Car+CoreDataProperties.swift
//  CoreData4APP
//
//  Created by TK on 2016/9/20.
//  Copyright © 2016年 TK. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Car {

    @NSManaged var plate: String?
    @NSManaged var belongto: NSManagedObject?

}
