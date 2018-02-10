//
//  Plant.swift
//  Happy Ivy
//
//  Created by Lucas Dachman on 2/9/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import Foundation

class Plant {
    
    static var plantList: [Plant] = []
    
    // MARK: Public Members
    var name: String?
    var species: String?
    var description: String?
    
    // MARK: Private Members
    private var air: Int = 10
    private var water: Int = 10
    private var sun: Int = 10
    private var love: Int = 10
    
    // MARK: Initializers
    init(name: String) {
        self.name = name
    }
    init(name: String, species: String, description: String) {
        self.name = name
        self.species = species
        self.description = description
    }
    
    // MARK: Public Methods
    func increaseAir() {
        air += 5
    }
    func decreaseAir() {
        air -= 5
    }
    func increaseWater() {
        water += 5
    }
    func decreaseWater() {
        water -= 5
    }
    func increaseSun() {
        sun += 5
    }
    func decreaseSun() {
        sun -= 5
    }
    func increaseLove() {
        love += 5
    }
    func decreaseLove() {
        love -= 5
    }
    
    
}
