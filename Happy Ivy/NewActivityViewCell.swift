//
//  ActivityCollectionViewCell.swift
//  Happy Ivy
//
//  Created by Volta on 2/10/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit
import CoreData

class NewActivityViewCell: UICollectionViewCell {
     // Derived from https://www.raywenderlich.com/136159/uicollectionview-tutorial-getting-started
    
    var name : String!
    
    // User Managed Object
    var Activity: [Activity] = []
    
    
    
    //let sb = UIStoryboard.init(name: "Main", bundle: nil)
    
    @IBOutlet weak var activityButton: UIButton!
    
    @IBAction func activityButtonAction(_ sender: Any) {
        print(name)
        
        let managedContext = PersistenceService.context
        
        // Declare activity object to hold the first User data entry
        var activity : NSObject
        
        // Initialize an entry in data model.
        let entity = NSEntityDescription.entity(forEntityName: "Activity", in: managedContext)!
        activity = NSManagedObject(entity: entity, insertInto: managedContext)
        
        // Set entry value for name
        activity.setValue(name, forKeyPath: "name")
        
    }
    
    
    
    
    
}
