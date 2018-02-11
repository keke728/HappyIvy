//
//  ToDoTableViewCell.swift
//  Happy Ivy
//
//  Created by Volta on 2/11/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit
import CoreData

class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    
    let isChecked : Bool = false
    
    @IBAction func checkButtonClick(_ sender: Any) {
        print("clicked")
        // Get Context
        let managedContext = PersistenceService.context
        
        // Declare user object to hold the first User data entry
        var newActivity : NSObject
        var plants: [Plant_entity] = []
        var currentPlant: Plant_entity?
        
        // Initialize an entry in data model.
        let entity = NSEntityDescription.entity(forEntityName: "Activity", in: managedContext)!
        newActivity = NSManagedObject(entity: entity, insertInto: managedContext)
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Plant_entity")
        do { plants = try managedContext.fetch(fetchRequest) as! [Plant_entity] }
        catch let error as NSError { print("Could not fetch. \(error), \(error.userInfo)") }
        //let entityPlant = NSEntityDescription.entity(forEntityName: "Plant", in: managedContext)!
        currentPlant = plants.last!
        
        
        if !isChecked{
            newActivity.setValue(true, forKey: "isComplete")
            currentPlant?.increaseAir()
            checkButton.imageView?.image = UIImage(named: "checked")
            
        }
        else{
            newActivity.setValue(false, forKey: "isComplete")
            currentPlant?.decreaseAir()
            self.imageView?.image = UIImage(named: "unchecked")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
