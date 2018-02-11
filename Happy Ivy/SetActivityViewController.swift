//
//  SetActivityViewController.swift
//  Happy Ivy
//
//  Created by Volta on 2/10/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit
import CoreData

class SetActivityViewController: UIViewController, UITableViewDataSource  {

    // MARK: - Outlets
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    //@IBOutlet weak var saveButton: UIButton!
    
    // User Managed Object
    var Activity: [NSManagedObject] = []
    
    // Save button
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide tableView for now
        tableView.isHidden = true
        
        // Derived from http://www.thomashanning.com/uitableview-tutorial-for-beginners/
        tableView.dataSource  = self
        
        // Get Singleton
        let selectedActivity = SelectedActivitySingleton.sharedInstance
        
        let saveButton : UIBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.done, target: navigationItem.rightBarButtonItem, action: nil)
        // Add Save Button
        //saveButton.title = "Save"

        navigationItem.setRightBarButton(saveButton, animated: false)
        
        // Edit textField appearance
        //textField.setFr = 25
        
        // Edit button appearance
        //saveButton.layer.cornerRadius = 10
        //saveButton.clipsToBounds = true
        //saveButton.contentEdgeInsets = UIEdgeInsetsMake(30, 100, 30, 30)
        
        // Hide tab bar
        self.tabBarController?.tabBar.isHidden = true
        /*
        let managedContext = PersistenceService.context
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Activity")
        do { Activity = try managedContext.fetch(fetchRequest) as! [Activity] }
        catch let error as NSError { print("Could not fetch. \(error), \(error.userInfo)") }
        let activity : NSObject = Activity[0]//Activity.last! as! Activity
         */
        
        //activityLabel.text = selectedActivity.name
        
        activityImage.image = UIImage(named: selectedActivity.name!)

        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        let text = "Repeat?"
        cell.textLabel?.text = text
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
