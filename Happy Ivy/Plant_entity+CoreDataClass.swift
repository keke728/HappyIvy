//
//  Plant_entity+CoreDataClass.swift
//  Happy Ivy
//
//  Created by Lucas Dachman on 2/10/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Plant_entity)
public class Plant_entity: NSManagedObject {

    // This function allows for setting initial values
    public override func awakeFromInsert() {
        self.air = 10
        self.water = 10
        self.sun = 10
        self.love = 10
    }
}
