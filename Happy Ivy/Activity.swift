//
//  Activity.swift
//  Happy Ivy
//
//  Created by Volta on 2/10/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit

// This class will be a data model for simulations
// Includes a name and image
class Activity {
    
    //MARK: Properties
    var name: String
    var image: UIImage
    
    //MARK: Initialization
    
    init?(name: String, image: UIImage){
        
        // Initialization should fail if a name is not provided
        // TODO: test if image is provided
        if name.isEmpty {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.image = image
        
    }
    
}
