//
//  Plant_entity+CoreDataProperties.swift
//  Happy Ivy
//
//  Created by Lucas Dachman on 2/10/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//
//

import Foundation
import CoreData


extension Plant_entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Plant_entity> {
        return NSFetchRequest<Plant_entity>(entityName: "Plant_entity")
    }

    @NSManaged public var air: Int16
    @NSManaged public var love: Int16
    @NSManaged public var name: String?
    @NSManaged public var plant_description: String?
    @NSManaged public var species: String?
    @NSManaged public var sun: Int16
    @NSManaged public var water: Int16
    
    // MARK: inc / dec
    func increaseAir() { air += 5 }
    func decreaseAir() { air -= 5 }
    func increaseWater() { water += 5 }
    func decreaseWater() { water -= 5 }
    func increaseSun() { sun += 5 }
    func decreaseSun() { sun -= 5 }
    func increaseLove() { love += 5 }
    func decreaseLove() { love -= 5 }

}
