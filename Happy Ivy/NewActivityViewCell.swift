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
    
    var selectedActivityName : String!
    var selectedActivityType : String!
    
    // User Managed Object
    var Activity: [NSManagedObject] = []
    
    
    
    //let sb = UIStoryboard.init(name: "Main", bundle: nil)
    
    @IBOutlet weak var activityButton: UIButton!
    
    @IBAction func activityButtonAction(_ sender: Any) {
        
        print(selectedActivityName)
        
        let selectedActivity = SelectedActivitySingleton.sharedInstance
        selectedActivity.name = selectedActivityName
        selectedActivity.type = selectedActivityType
    }
    
    
    
    
    
}
