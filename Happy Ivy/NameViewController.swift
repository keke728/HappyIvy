//
//  NameViewController.swift
//  Happy Ivy
//
//  Created by Keke Wu on 2/9/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit
import CoreData

class NameViewController: UIViewController, UITextFieldDelegate {
     @IBOutlet weak var nameBox: UITextField!
    
     var user = NameInfo()
     var name:String?

    
    override func viewDidLoad() {
        nameBox.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Save
    
    /**
     Saves input string as user name to User entity in Model data model
     Derived from: https://www.raywenderlich.com/173972/getting-started-with-core-data-tutorial-2
     - Parameters:
     - name: the user name to be saved
     */
    func savePlant(name: String) {
        
        // Get Context
        let managedContext = PersistenceService.context
        
        // Declare user object to hold the first User data entry
        var plant : NSObject
        
        // Initialize an entry in data model.
        let entity = NSEntityDescription.entity(forEntityName: "Plant_entity", in: managedContext)!
        plant = NSManagedObject(entity: entity, insertInto: managedContext)
        
        // Set entry value for name
        plant.setValue(name, forKeyPath: "name")
        
        // Perform built in save function
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

}

// MARK:- ---> UITextFieldDelegate
extension NameViewController {
    
    func textFieldShouldReturn(_ nameBox: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        savePlant(name: nameBox.text!)
        performSegue(withIdentifier: "gotoPlant", sender: NameViewController.self)
        return true
    }
    
}
// MARK: UITextFieldDelegate <---
