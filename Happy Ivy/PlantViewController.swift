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
    var User: [NSManagedObject] = []
    
    override func viewDidLoad() {
        
        //* TODO: put the user variable and all these lines of code into a global class (as well as User Managed Object)
        //      See https://stackoverflow.com/questions/24333142/access-variable-in-different-class-swift
        
        // Get User Data store in user
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        do { User = try managedContext.fetch(fetchRequest) }
        catch let error as NSError { print("Could not fetch. \(error), \(error.userInfo)") }
        let user : NSObject = User[0]
        
        plantName.text = user.value(forKey: "name") as? String // add user's name
        //plantName.text = user.userName
        
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
