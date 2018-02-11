//
//  selectedActivity.swift
//  Happy Ivy
//
//  Created by Volta on 2/11/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit

// Singleton for selected Activity name
// Derived from: https://stackoverflow.com/questions/38793601/singleton-usage-in-swift

final class SelectedActivitySingleton{
    
    // TODO: Don't use singleton for selected Activity name, figure out how to pass data from selected collection view cell to SetActivityViewController
    var name : String!
    var type : String!
    
    static let sharedInstance = SelectedActivitySingleton()
    
    private init(){
        
    }
}
