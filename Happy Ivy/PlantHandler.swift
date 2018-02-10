//
//  PlantHandler.swift
//  Happy Ivy
//
//  Created by Lucas Dachman on 2/9/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import Foundation

class plantHandler {
    
    // Public Data
    static let shared = plantHandler()
    var plantList: [Plant]
    
    // Private Data
    private init() {
        plantList = []
    }
}
