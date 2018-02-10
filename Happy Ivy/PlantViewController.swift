//
//  PlantViewController.swift
//  Happy Ivy
//
//  Created by Keke Wu on 2/9/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit
import CoreData

class PlantViewController: UIViewController {
    
    //var user = NameInfo()
    @IBOutlet weak var plantName: UITextField!
    
    // User Managed Object
    var Plants: [Plant_entity] = []
    
    override func viewDidLoad() {
        
        //* TODO: put the user variable and all these lines of code into a global class (as well as User Managed Object)
        //      See https://stackoverflow.com/questions/24333142/access-variable-in-different-class-swift
        
        // Derived from: https://www.raywenderlich.com/173972/getting-started-with-core-data-tutorial-2
        // Get User Data store in user
        let managedContext = PersistenceService.context
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Plant_entity")
        do { Plants = try managedContext.fetch(fetchRequest) as! [Plant_entity] }
        catch let error as NSError { print("Could not fetch. \(error), \(error.userInfo)") }
        let plant : Plant_entity = Plants[0]
        
        plantName.text = plant.name // add user's name
        
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
