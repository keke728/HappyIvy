//
//  ActivityCollectionViewCell.swift
//  Happy Ivy
//
//  Created by Volta on 2/10/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit

class NewActivityViewCell: UICollectionViewCell {
     // Derived from https://www.raywenderlich.com/136159/uicollectionview-tutorial-getting-started
    
    var name : String!
    
    @IBOutlet weak var activityButton: UIButton!
    
    @IBAction func activityButtonAction(_ sender: Any) {
        print(name)
    }
    
    
    
    
}
