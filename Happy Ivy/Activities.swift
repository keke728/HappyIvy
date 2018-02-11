//
//  Activities.swift
//  Happy Ivy
//
//  Created by Volta on 2/10/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit

class Activities{
    
    // Dictionaries to hold Activity Images in each category
    let PersonalCareAndHealthImages : [Int: UIImage]
    let PersonalCareAndHealthNames : [Int: String]
    let LifeAndHabitsImages : [Int: UIImage]
    let LifeAndHabitsNames : [Int: String]
    
    // Activity Images
    let tv: UIImage
    let moon: UIImage
    let lipstick: UIImage
    let dress: UIImage
    let broom: UIImage
    
    //let categories: [String: UIImage]
    
    //let personalCareAndHealthImages: [UIImage] = [tv]
    
    //let categories: [String: [UIImage]] = ["personalCareAndHealth": personalCareAndHealthImages]
    //= ["personalCareAndHealth", "LifeAndHabits", "ExerciseAndEntertainment", "SocialAndCommunity"]
    
    init(){
        
        // Initialize images
        tv = UIImage(named: "tv")!
        moon = UIImage(named: "moon")!
        lipstick = UIImage(named: "lipstick")!
        dress = UIImage(named: "dress")!
        broom = UIImage(named: "broom")!
        
        // Fill dictionary with key value pairs
        PersonalCareAndHealthImages = [0: lipstick, 1: dress]
        PersonalCareAndHealthNames = [0: "lipstick", 1: "dress"]
        LifeAndHabitsImages = [0: broom, 1: moon]
        LifeAndHabitsNames = [0: "lipstick", 1: "moon"]
        
        //categories = ["personalCareAndHealth": personalCareAndHealthImages, "LifeAndHabits": LifeAndHabitsImages]
        
    }
    

    
}
