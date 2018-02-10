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
     
     - Parameters:
     - name: the user name to be saved
     */
    func saveName(name: String) {
        
        // Instatiate appDelegate and managedContext
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Declare user object to hold the first User data entry
        var user : NSObject
        
        // Initialize an entry in data model.
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        user = NSManagedObject(entity: entity, insertInto: managedContext)
        
        // Set entry value for name
        user.setValue(name, forKeyPath: "name")
        
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
        saveName(name: nameBox.text!)
        performSegue(withIdentifier: "gotoPlant", sender: NameViewController.self)
        return true
    }
    
}
// MARK: UITextFieldDelegate <---
