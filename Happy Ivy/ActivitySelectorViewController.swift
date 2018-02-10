//
//  ActivitySelectorViewController.swift
//  Happy Ivy
//
//  Created by Volta on 2/10/18.
//  Copyright © 2018 Keke Wu. All rights reserved.
//

import UIKit

class ActivitySelectorViewController: UIViewController {

    // MARK: - Actions
    @IBAction func activityTvButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "setActivitySegue" {
            
            guard let webViewController = segue.destination as? WebViewController else {
                
                fatalError("Unexpected destination: \(segue.destination)")
                
            }
            
            guard let selectedSimulationCell = sender as? SimulationTableViewCell else {
                
                fatalError("Unexpected sender: \(String(describing: sender))")
                
            }
            
            guard let indexPath = tableView.indexPath(for: selectedSimulationCell) else{
                
                fatalError("The selected cell is not being displayed correctly by the table")
            }
            
            let selectedSimulation = simulations[indexPath.row]
            
            webViewController.simulation = selectedSimulation
            
        }
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
