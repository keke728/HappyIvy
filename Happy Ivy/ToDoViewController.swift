//
//  ToDoViewController.swift
//  Happy Ivy
//
//  Created by Volta on 2/11/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit
import CoreData

class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var activities: [Activity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundView = UIImageView.init(image: UIImage(named: "newActivityBackground")) 
        
        let managedContext = PersistenceService.context
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Activity")
        do { activities = try managedContext.fetch(fetchRequest) as! [Activity] }
        catch let error as NSError { print("Could not fetch. \(error), \(error.userInfo)") }
        //currentPlant = plants.last!
        
        tableView.dataSource  = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")! as! ToDoTableViewCell
        
        let cellActivity = activities[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        let myDate = dateFormatter.string(from: cellActivity.value(forKey: "activity_date") as! Date)
        
        cell.activityImage.image = UIImage(named: cellActivity.value(forKey: "img_name")! as! String)
        cell.activityName.text = cellActivity.value(forKey: "name") as? String
        cell.time.text = myDate
        
        //cell.textLabel?.text = text
        return cell
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
